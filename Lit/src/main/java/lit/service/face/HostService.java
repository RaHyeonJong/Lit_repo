package lit.service.face;

import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import lit.dto.Day_off;
import lit.dto.Image;
import lit.dto.Lodge;
import lit.dto.Pay;

public interface HostService {

	
	//-----------단계별 정보등록
	//1단계숙소정보등록
	public void insertFirst(Lodge lodge);

	//2단계숙소정보등록
	public void insertSecond(Day_off day_off);

	//3단계숙소정보등록
	public void insertThird(Lodge lodge);

	
	//---------단계별 정보수정
	
	
	//본인이 등록한 1,2,3단계정보보기
	public List<Lodge> viewHostElement(Lodge lodge);
	
	//1단계 정보수정
	public void hostElementFirstFix(Lodge lodge);

	
	//2단계 정보수정
	public void hostElementSecondFix(Lodge lodge);

	//3단계 정보수정
	public void hostElementThirdFix(Lodge lodge);
	
	//-----------숙소추가하기

	//본인이 등록한 숙소리스트
	public List hostMyLodgeList();

	public void deleteDayoff(Day_off day_off);

	public void deleteAllDayoff(int lodge_no);

	
	//숙소 이미지 등록
	public void hostaddViewList(MultipartHttpServletRequest msr,HttpServletRequest req,Image image);

	public void updateAvailabeTerm(Lodge lodge);

	public void updateLocation(Lodge lodge);
	
	public void updateConvenient(Lodge lodge);
	
	// 호스트페이지 : 숙소리스트 가져오기
	public List<Lodge> getLodgeList(HttpSession session);

	//호스트페이지 : 편의시설 공간 가져오기
	public Lodge getconveniences(Lodge lodge);
	
	// 호스트페이지 : 결제내역 가져오기
	public List<Pay> getPayList(int lodge_no);

}
