package lit.service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import lit.dto.Day_off;
import lit.dto.Image;
import lit.dto.Lodge;

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
	public List viewHostElement();
	
	//1단계 정보수정
	public void hostElementFirstFix(Lodge lodge);

	
	//2단계 정보수정
	public void hostElementSecondFix(Lodge lodge);

	//3단계 정보수정
	public void hostElementThirdFix(Lodge lodge);
	
	//-----------숙소추가하기

	//본인이 등록한 숙소리스트
	public List hostMyLodgeList();

	
	//숙소 이미지 등록
	public void hostaddViewList(MultipartHttpServletRequest msr,HttpServletRequest req,Image image);

}
