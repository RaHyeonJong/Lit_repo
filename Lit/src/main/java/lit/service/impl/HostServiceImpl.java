package lit.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import lit.dao.face.HostDao;
import lit.dto.Day_off;
import lit.dto.Image;
import lit.dto.Lodge;
import lit.service.face.HostService;

@Service
public class HostServiceImpl implements HostService{
	
	@Autowired HostDao hostDao;
	
	
	
	//----------단계별 정보등록
	//1단계숙소정보등록
	@Override
	public void insertFirst(Lodge lodge) {
		hostDao.insertOne(lodge);
		
		
	}
	
	
	//2단계숙소정보등록
	
	//노출기간업데이트
	@Override
	public void updateAvailabeTerm(Lodge lodge) {
		hostDao.updateAvailable(lodge);
		
	}
	@Override
	public void insertSecond(Day_off day_off) {
		hostDao.insertTwo(day_off);
	}
	
	//3단계숙소정보등록
	@Override
	public void insertThird(Lodge lodge) {
		
		hostDao.insertThree(lodge);
		
	}
	
	//-------------단계별 정보 수정
	
	//본인이 등록한 1,2,3단계 정보보기
	
	
	//위치업데이트
	@Override
	public void updateLocation(Lodge lodge) {
		
		hostDao.updateLocation1(lodge);
		
	}
	@Override
	public List viewHostElement() {
		
		return hostDao.selectByHostEdge();
	}
	
	
	
	
	//1단계 정보수정
	@Override
	public void hostElementFirstFix(Lodge lodge) {
		
		hostDao.updateElementOne(lodge);
		
	}
	
	//2단계 정보수정
	@Override
	public void hostElementSecondFix(Lodge lodge) {

		hostDao.updateElementTwo(lodge);
		
	}
	
	//3단계 정보수정
	@Override
	public void hostElementThirdFix(Lodge lodge) {

		hostDao.updateElementThree(lodge);
		
	}
	
	
	
	//------------------숙소추가하기
	
	@Override
	public List hostMyLodgeList() {
		
		return hostDao.selectByHostMemno();
		
	}


	@Override
	public void deleteDayoff(Day_off day_off) {
		hostDao.deleteDayoff(day_off);
	}


	@Override
	public void deleteAllDayoff(int lodge_no) {
		hostDao.deleteAllDayoff(lodge_no);
	}
	
	
	public void hostaddViewList(MultipartHttpServletRequest msr,HttpServletRequest req,Image image) {
				
		List<MultipartFile> fileList = msr.getFiles("file");
		
		//이미지 경로
		String path = req.getSession().getServletContext().getRealPath("/resources/images/lodge_image/");
		
		for(MultipartFile mf : fileList) {
			String origin_name = mf.getOriginalFilename(); //파일 원본
			UUID uid = UUID.randomUUID();
			String stored_name = uid.toString()+"_"+origin_name;
//			long fileSize = mf.getSize(); //파일 사이즈
			
			File file = new File(path);
			if(origin_name != null && !origin_name.equals("")) {
					//파일명 앞에 업로드 시간 초단위로 붙여 파일명 중복 방지
					image.setOrigin_name(origin_name);
					image.setStored_name(stored_name);
					
			}
			System.out.println("orgin_name :"+ image.getOrigin_name());
			System.out.println("stored_name :"+ image.getStored_name());
			System.out.println("lodge_no :"+ image.getLodge_no());
			
			String safeFile = path+System.currentTimeMillis()+origin_name;
			
			
			hostDao.insertLodgeView(image);
			
			try {
				mf.transferTo(new File(safeFile));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	
	}
	
	

}
