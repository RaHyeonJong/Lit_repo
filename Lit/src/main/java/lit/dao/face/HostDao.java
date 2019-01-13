package lit.dao.face;

import java.util.List;

import lit.dto.Day_off;
import lit.dto.Image;
import lit.dto.Lodge;
import lit.dto.Pay;

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
	public List<Lodge> selectByHostEdge(Lodge lodge);

	//1단계 정보수정
	public void updateElementOne(Lodge lodge);
	
	//2단계 정보수정
	public void updateElementTwo(Lodge lodge);

	//3단계 정보수정
	public void updateElementThree(Lodge lodge);
	
	//--------------숙소추가하기

	//호스트 mem_no로 select하기
	public List selectByHostMemno();

	public void deleteDayoff(Day_off day_off);

	public void deleteAllDayoff(int lodge_no);

	//숙소 이미지 넣기
	public void insertLodgeView(Image image);

	//노출기간 업데이트
	public void updateAvailable(Lodge lodge);
	
	//편의시설 공간 업데이트
	public void convenientUpdate(Lodge lodge);

	//위치정보 수정
	public void updateLocation1(Lodge lodge);
	public List<Lodge> getLodgeList(int mem_no);

	public List<Pay> getPayList(int lodge_no);

}
