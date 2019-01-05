package lit.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	//1단계 숙소기본정보등록페이지
	@RequestMapping(value="/host/hostFirst", method=RequestMethod.GET)
	public void hostFirst() {
		
		
		
	}
	
	//1단계 숙소기본정보등록페이지
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
	
	
	
	
	
	//1단계 주소등록페이지
	@RequestMapping(value="/host/firstLocation", method=RequestMethod.GET)
	public void firstLocation() {
		
	
	}
	
	//1단계 주소등록페이지
	@RequestMapping(value="/host/firstLocation", method=RequestMethod.POST)
	public void firstLocationElement() {
	
	
	}
	
	
	
	//1단계 주소확인페이지
	@RequestMapping(value="/host/checkLocation", method=RequestMethod.GET)
	public void checkLocation(Model model, String addr, String cityLat, String cityLng) {
		
		logger.info(addr);
		System.out.println(cityLat);
		model.addAttribute("addr", addr);
		model.addAttribute("lng", cityLng);
		model.addAttribute("lat", cityLat);
		

	}
	
	//1단계 주소확인페이지
	@RequestMapping(value="/host/checkLocation", method=RequestMethod.POST)
	public void checkLocationElement(Lodge lodge) {
		
		
		

		
	
	}
	
	//1단계 편의시설
	@RequestMapping(value="/host/firstConveniences", method=RequestMethod.GET)
	public void firstCon() {
			
			
				}
		
	//1단계 편의시설
	@RequestMapping(value="/host/firstConveniences", method=RequestMethod.POST)
	public void firstConproc(Lodge lodge) {
		
		
		}
	
	//1단계 기타시설
	@RequestMapping(value="/host/otherUse", method=RequestMethod.GET)
	public void otherUse() {
				
				
			}
			
	//1단계 기타시설
	@RequestMapping(value="/host/otherUse", method=RequestMethod.POST)
	public void otherUseproc(Lodge lodge) {
			
			
			}
	
	//1단계 숙소관리
		@RequestMapping(value="/host/manageLodge", method=RequestMethod.GET)
		public void manageLodge(Model model) {
			

			
			  Date today = new Date();
			  SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
			  model.addAttribute("today", date.format(today));
			  
			  

		

		
				}
				
		//1단계 숙소관리
		@RequestMapping(value="/host/manageLodge", method=RequestMethod.POST)
		public ModelAndView manageLodgeProc(@RequestParam(defaultValue="1") int selectShowMonth, 
											ModelAndView mav,
											String selectDisableDay )
		{
			  
			 mav.setViewName("jsonView");
			 Date today = new Date();
			 SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
			 mav.addObject("today", date.format(today));
			
			 
		
			  
			 Calendar cal = Calendar.getInstance ( );//오늘 날짜를 기준으루..
			 cal.add ( cal.MONTH, selectShowMonth ); //2개월 전....
			  
			 mav.addObject("testDate", date.format(cal.getTime()));
			 
			 logger.info(selectDisableDay);
				
			 return mav;
				
				}
		
		//1단계 요금설정
		@RequestMapping(value="/host/lodgeCharge", method=RequestMethod.GET)
		public void lodgeCharge() {
					
					
				}
				
		//1단계 요금설정
		@RequestMapping(value="/host/lodgeCharge", method=RequestMethod.POST)
		public @ResponseBody int  lodgeChargeProc(@RequestParam(defaultValue = "0")int inputCharge, Model model) {
				
	
			int checkCharge = 0;
			System.out.println(inputCharge);
			if(inputCharge < 10000) {
				
				checkCharge = 1;

				
			}
			
			
				
			
			return checkCharge;
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
