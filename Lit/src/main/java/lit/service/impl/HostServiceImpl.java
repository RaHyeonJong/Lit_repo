package lit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lit.dao.face.HostDao;
import lit.dto.Day_off;
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
	
	
	
	
	
	
	
	
	

}
