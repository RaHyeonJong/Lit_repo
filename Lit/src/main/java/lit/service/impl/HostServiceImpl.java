package lit.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lit.dao.face.HostDao;
import lit.service.face.HostService;

@Service
public class HostServiceImpl implements HostService{
	
	@Autowired HostDao hostDao;
	
	
	
	//----------단계별 정보등록
	//1단계숙소정보등록
	@Override
	public void insertFirst() {
		
		hostDao.insertOne();
		
	}
	
	
	//2단계숙소정보등록
	@Override
	public void insertSecond() {
		hostDao.insertTwo();
		
	}
	
	//3단계숙소정보등록
	@Override
	public void insertThird() {
		
		hostDao.insertThree();
		
	}
	
	//-------------단계별 정보 수정
	
	//1단계 정보수정
	@Override
	public void hostElementFirstFix() {
		
		hostDao.updateElementOne();
		
	}
	
	//2단계 정보수정
	@Override
	public void hostElementSecondFix() {

		hostDao.updateElementTwo();
		
	}
	
	//3단계 정보수정
	@Override
	public void hostElementThirdFix() {

		hostDao.updateElementThree();
		
	}
	
	
	
	
	
	
	
	
	

}
