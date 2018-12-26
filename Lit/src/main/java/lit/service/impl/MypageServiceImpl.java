package lit.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lit.dao.face.JoinDao;
import lit.dao.face.MypageDao;
import lit.dto.Comment;
import lit.dto.Favorite;
import lit.dto.Image;
import lit.dto.Member;
import lit.dto.Pay;
import lit.service.face.MypageService;
import lit.util.Paging;

@Service
public class MypageServiceImpl implements MypageService{
	
	@Autowired MypageDao mypageDao;
	@Autowired JoinDao joinDao;

	@Override
	public void updateProfile(ServletContext context, MultipartFile file, Member mem ) {		
		if(!"".equals(file.getOriginalFilename())) {
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
			image.setMem_no(mem.getMem_no());
			
			int existPhoto = mypageDao.checkMyPhoto(image);
			
			if(existPhoto == 1)
				mypageDao.updateMyPhoto(image);
			else 
				joinDao.insertMyPhoto(image);
		}
		mypageDao.updateProfile(mem);
	}

	@Override
	public Member getMemberByNo(Member mem) {
		return mypageDao.getMemberByNo(mem);
	}

	@Override
	public int getTotalCommCnt(int mem_no) {
		return mypageDao.getTotalCommCnt(mem_no);
	}

	@Override
	public List<Comment> getCommentList(Paging paging) {
		return mypageDao.getCommentList(paging);
	}

	@Override
	public int getTotalFavorCnt(int mem_no) {
		return mypageDao.getTotalFavorCnt(mem_no);
	}

	@Override
	public List<Favorite> getFavorList(Paging paging) {
		return mypageDao.getFavorList(paging);
	}

	@Override
	public void deleteMyFavor(Favorite favor) {
		mypageDao.deleteMyFavor(favor);
	}

	@Override
	public int getTotalPayCnt(int mem_no) {
		return mypageDao.getTotalPayCnt(mem_no);
	}

	@Override
	public List<Pay> getPayList(Paging paging) {
		return mypageDao.getPayList(paging);
	}
	
	
}
