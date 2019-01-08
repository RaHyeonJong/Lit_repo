package lit.dao.face;

import java.util.List;

import lit.dto.Day_off;
import lit.dto.Lodge;

public interface HostDao {
	
	//-------------단계별 정보등록
	
	//1단계 숙소등록
	public void insertOne(Lodge lodge);

	//2단계 숙소등록
	public void insertTwo(Day_off day_off);


	
	//3단계 숙소등록
	public void insertThree(Lodge lodge);
	
	
	//---------------단계별 정보수정
	
	//본인이 등록한 숙소정보 select
	public List selectByHostEdge();

	//1단계 정보수정
	public void updateElementOne(Lodge lodge);
	
	//2단계 정보수정
	public void updateElementTwo(Lodge lodge);

	//3단계 정보수정
	public void updateElementThree(Lodge lodge);
	
	//--------------숙소추가하기

	//호스트 mem_no로 select하기
	public List selectByHostMemno();

	//숙소 이미지 넣기
	public void insertLodgeView();

}
