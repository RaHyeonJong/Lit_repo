package lit.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lit.dao.face.JoinDao;
import lit.dto.Image;
import lit.dto.Member;
import lit.service.face.JoinService;

@Service
public class JoinServiceImpl implements JoinService{
	
	@Autowired JoinDao joinDao;

	@Override
	public boolean checkId(Member member) {
		
		int idCnt = joinDao.checkId(member);
		if(idCnt > 0)
			return true;
		
		return false;
	}

	@Override
	public void insertMember(Member member) {
		joinDao.insertMember(member);
	}

	@Override
	public void insertMyPhoto(ServletContext context, MultipartFile file, int mem_no) {
		String uId = UUID.randomUUID().toString().split("-")[0];
		String stored = context.getRealPath("resources/images");
		String name = file.getOriginalFilename() + "_" + uId;
		
		File dest = new File(stored, name);
				
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Image image = new Image();
		image.setOrigin_name(file.getOriginalFilename());
		image.setStored_name(dest.getName());
		image.setMem_no(mem_no);
		
		joinDao.insertMyPhoto(image);
	}

}





