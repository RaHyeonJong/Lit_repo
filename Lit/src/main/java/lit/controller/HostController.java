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
		
	}
	
	//------------------------------------------------------------------
	
	
	//1단계등록페이지
	@RequestMapping(value="/host/hostFirst", method=RequestMethod.GET)
	public void hostFirst() {
		
	}
	
	//1단계등록페이지
	@RequestMapping(value="/host/hostFirst", method=RequestMethod.POST)
	public void hostFirstElement() {
		
		
	}
	
	//------------------------------------------------------------------
	
	//2단계등록페이지
	@RequestMapping(value="/host/hostSecond", method=RequestMethod.GET)
	public void hostSecond() {
			
		}
		
	//2단계등록페이지
	@RequestMapping(value="/host/hostSecond", method=RequestMethod.POST)
	public void hostSecondElement() {
			
			
		}
	//------------------------------------------------------------------
	
	//3단계등록페이지
	@RequestMapping(value="/host/hostThird", method=RequestMethod.GET)
	public void hostThird() {
				
			}
			
	//3단계등록페이지
	@RequestMapping(value="/host/hostThird", method=RequestMethod.POST)
	public void hostThirdElement() {
				
				
			}
			
		
	
	
	

}
