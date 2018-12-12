package lit.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lit.dto.Lodge;
import lit.service.face.HostService;

@Controller
public class HostController {
	
	Logger logger =  LoggerFactory.getLogger(HostController.class);
	
	@Autowired HostService hostService;
	
	
	//호스트등록 첫 메인페이지
	@RequestMapping(value="/host/hostMain", method=RequestMethod.GET)
	public void hostMain() {
		
		//호스트등록 메인은 설명부분이라 굳이 함수사용x
	}
	
	//---------- 숙소등록 ----------
	
	//--------------------------1단계
	//1단계등록페이지
	@RequestMapping(value="/host/hostFirst", method=RequestMethod.GET)
	public void hostFirst() {
		
		
		
	}
	
	//1단계등록페이지
	@RequestMapping(value="/host/hostFirst", method=RequestMethod.POST)
	public void hostFirstElement(Lodge lodge) {
		
				
		//1단계 숙소등록정보를 INSERT
		hostService.insertFirst(lodge);
		
	}
	
	//1단계등록페이지
	@RequestMapping(value="/host/firstRoom", method=RequestMethod.GET)
	public void firstRoom() {
		
		
		
	}
	
	//1단계등록페이지
	@RequestMapping(value="/host/firstRoom", method=RequestMethod.POST)
	public void firstRoomElement(Lodge lodge) {
	
	
	}
	
	//---------------------------1단계 끝
	
	//2단계등록페이지
	@RequestMapping(value="/host/hostSecond", method=RequestMethod.GET)
	public void hostSecond() {
			
		}
	
		
	//2단계등록페이지
	@RequestMapping(value="/host/hostSecond", method=RequestMethod.POST)
	public void hostSecondElement(Lodge lodge) {
			
		//2단계 숙소등록정보를 INSERT
		hostService.insertSecond(lodge);
			
		}

	
	//3단계등록페이지
	@RequestMapping(value="/host/hostThird", method=RequestMethod.GET)
	public void hostThird() {
				
			}
			
	//3단계등록페이지
	@RequestMapping(value="/host/hostThird", method=RequestMethod.POST)
	public void hostThirdElement(Lodge lodge) {
				
		
	//3단계 숙소등록정보를 INSERT
	hostService.insertThird(lodge);
				
			}
	
	
	
	//---------- 변경페이지 ----------
	
	//호스트등록정보 변경페이지
	@RequestMapping(value="/host/hostElementChange", method=RequestMethod.GET)
	public void hostElementChange() {
		
		
	}
	
	//1단계 숙소정보 수정
	@RequestMapping(value="/host/hostFirstFix", method=RequestMethod.GET)
	public void hostElementFirstFix() {
		
		List<Lodge> hostLodgeElementList = hostService.viewHostElement();
		
	}
	
	//1단계 숙소정보 수정
	@RequestMapping(value="/host/hostFirstFix", method=RequestMethod.POST)
	public void hostElementFirstFixProc(Lodge lodge) {
			
		hostService.hostElementFirstFix(lodge);
		}
	
	//2단계 숙소정보 수정
	@RequestMapping(value="/host/hostSecondFix", method=RequestMethod.GET)
	public void hostElementSecondFix() {
		
		List<Lodge> hostLodgeElementList = hostService.viewHostElement();
	}
	
	//2단계 숙소정보 수정
	@RequestMapping(value="/host/hostSecondFix", method=RequestMethod.POST)
	public void hostElementSecondFixProc(Lodge lodge) {
		hostService.hostElementSecondFix(lodge);
	}
		
	
	//3단계 숙소정보 수정
	@RequestMapping(value="/host/hostThirdFix", method=RequestMethod.GET)
	public void hostElementThirdFix() {
		
		List<Lodge> hostLodgeElementList = hostService.viewHostElement();
		
	}
	
	//3단계 숙소정보 수정
	@RequestMapping(value="/host/hostThirdFix", method=RequestMethod.POST)
	public void hostElementThirdFixProc(Lodge lodge) {
			
		hostService.hostElementThirdFix(lodge);
		}
		
	
	//---------------------숙소추가하기
	//숙소추가하기 페이지
	@RequestMapping(value="/host/addLodge", method=RequestMethod.GET)
	public void hostAddLodge() {
		
		
		List<Lodge> myLodgeList =  hostService.hostMyLodgeList();
		
	}

			
			
		
	
	
	

}
