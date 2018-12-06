package lit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lit.service.face.HostService;

@Controller
public class HostController {
	
	@Autowired HostService hostService;
	
	
	//호스트등록 첫 메인페이지
	@RequestMapping(value="/host/hostMain", method=RequestMethod.GET)
	public void hostMain() {
		
		//호스트등록 메인은 설명부분이라 굳이 함수사용x
	}
	
	//---------- 숙소등록 ----------
	
	
	//1단계등록페이지
	@RequestMapping(value="/host/hostFirst", method=RequestMethod.GET)
	public void hostFirst() {
		
		
		
	}
	
	//1단계등록페이지
	@RequestMapping(value="/host/hostFirst", method=RequestMethod.POST)
	public void hostFirstElement() {
		
				
		//1단계 숙소등록정보를 INSERT
		hostService.insertFirst();
		
	}
	

	
	//2단계등록페이지
	@RequestMapping(value="/host/hostSecond", method=RequestMethod.GET)
	public void hostSecond() {
			
		}
	
		
	//2단계등록페이지
	@RequestMapping(value="/host/hostSecond", method=RequestMethod.POST)
	public void hostSecondElement() {
			
		//2단계 숙소등록정보를 INSERT
		hostService.insertSecond();
			
		}

	
	//3단계등록페이지
	@RequestMapping(value="/host/hostThird", method=RequestMethod.GET)
	public void hostThird() {
				
			}
			
	//3단계등록페이지
	@RequestMapping(value="/host/hostThird", method=RequestMethod.POST)
	public void hostThirdElement() {
				
		
	//3단계 숙소등록정보를 INSERT
	hostService.insertThird();
				
			}
	
	
	
	//---------- 변경페이지 ----------
	
	//호스트등록정보 변경페이지
	@RequestMapping(value="/host/hostElementChange", method=RequestMethod.GET)
	public void hostElementChange() {
		
		
	}
	
	//1단계 숙소정보 수정
	@RequestMapping(value="/host/hostFirstFix", method=RequestMethod.GET)
	public void hostElementFirstFix() {
		
		
		
	}
	
	//1단계 숙소정보 수정
	@RequestMapping(value="/host/hostFirstFix", method=RequestMethod.POST)
	public void hostElementFirstFixProc() {
			
		hostService.hostElementFirstFix();
		}
	
	//2단계 숙소정보 수정
	@RequestMapping(value="/host/hostSecondFix", method=RequestMethod.GET)
	public void hostElementSecondFix() {
		
	}
	
	//2단계 숙소정보 수정
	@RequestMapping(value="/host/hostSecondFix", method=RequestMethod.POST)
	public void hostElementSecondFixProc() {
		hostService.hostElementSecondFix();
	}
		
	
	//3단계 숙소정보 수정
	@RequestMapping(value="/host/hostThirdFix", method=RequestMethod.GET)
	public void hostElementThirdFix() {
		
	}
	
	//3단계 숙소정보 수정
	@RequestMapping(value="/host/hostThirdFix", method=RequestMethod.POST)
	public void hostElementThirdFixProc() {
			
		hostService.hostElementThirdFix();
		}
		

			
			
		
	
	
	

}
