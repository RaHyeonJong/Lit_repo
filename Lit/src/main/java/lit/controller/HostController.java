package lit.controller;

import java.lang.reflect.Type;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import lit.dto.Day_off;
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
	
		
	}
	
	
	//1단계등록페이지
	@RequestMapping(value="/host/firstRoom", method=RequestMethod.GET)
	public void firstRoom() {}
	
	//1단계등록페이지
	@RequestMapping(value="/host/firstRoom", method=RequestMethod.POST)
	public String firstRoomElement(Lodge lodge, HttpSession session) {
		
		
		session.setAttribute("building_case_no",lodge.getBuilding_case_no());
		session.setAttribute("lodge_case_no",lodge.getLodge_case_no());
		session.setAttribute("lodge_name",lodge.getLodge_name());
		session.setAttribute("lodge_room",lodge.getLodge_room());
		session.setAttribute("lodge_capatity",lodge.getLodge_capacity());
		
		return "redirect:/host/firstLocation";
	}
	
	
	//1단계 주소등록페이지
	@RequestMapping(value="/host/firstLocation", method=RequestMethod.GET)
	public void firstLocation() {}
	
	//1단계 주소등록페이지
	@RequestMapping(value="/host/firstLocation", method=RequestMethod.POST)
	public String firstLocationElement(Lodge lodge,Model model,HttpSession session,Double cityLat, Double cityLng) {
		
		
		session.setAttribute("lodge_addr", lodge.getLodge_addr());
		
		lodge.setLatitude(cityLat);
		lodge.setLongitude(cityLng);
		session.setAttribute("lng", lodge.getLongitude());
		session.setAttribute("lat", lodge.getLatitude());
		
		
		return "redirect:/host/checkLocation";
	}
	
	
	
	//1단계 주소확인페이지
	@RequestMapping(value="/host/checkLocation", method=RequestMethod.GET)
	public void checkLocation(Model model, String addr, String cityLat, String cityLng) {
		
		model.addAttribute("addr", addr);
		model.addAttribute("lng", cityLng);
		model.addAttribute("lat", cityLat);

	}
	//1단계 주소확인페이지
	@RequestMapping(value="/host/checkLocation", method=RequestMethod.POST)

	public String checkLocationElement(Lodge lodge,HttpSession session) {
		session.setAttribute("lodge_addr", lodge.getLodge_addr());
		session.setAttribute("longitude", lodge.getLongitude());
		session.setAttribute("latitude", lodge.getLatitude());

			
		//승국
		session.setAttribute("latitude", lodge.getLatitude());
		session.setAttribute("longitube", lodge.getLongitude());
		session.setAttribute("lodge_addr", lodge.getLodge_addr());
		//끝
		
		return "redirect:/host/firstConveniences";
	}
	
	//1단계 편의시설
	@RequestMapping(value="/host/firstConveniences", method=RequestMethod.GET)
	public void firstCon(Lodge lodge) {}

	//1단계 편의시설
	@RequestMapping(value="/host/firstConveniences", method=RequestMethod.POST)
	public String firstConproc(Lodge lodge,HttpSession session) {
		
		String[] word = lodge.getConvenient_facility().split(",");
		
		System.out.println(lodge.getConvenient_facility());
		
		for(String word2 : word) {

			List<String> word3 = Arrays.asList(word);
			
			String w = word3.stream().map(facility->""+facility+"")
					.collect(Collectors.joining(""));
			
			lodge.setConvenient_facility(w);
		}
		
		
			session.setAttribute("convenient_facility", lodge.getConvenient_facility());
		
		return "redirect:/host/otherUse";
		}
	
	//1단계 기타시설
	@RequestMapping(value="/host/otherUse", method=RequestMethod.GET)
	public void otherUse() {}
			
	//1단계 기타시설
	@RequestMapping(value="/host/otherUse", method=RequestMethod.POST)
	public String otherUseproc(HttpSession session,Lodge lodge) {
			
		lodge.setBuilding_case_no((int)session.getAttribute("building_case_no"));
		lodge.setLodge_case_no((int)session.getAttribute("lodge_case_no"));
		lodge.setLodge_name((String)session.getAttribute("lodge_name"));
		lodge.setLodge_room((int)session.getAttribute("lodge_room"));
		lodge.setLodge_capacity((int)session.getAttribute("lodge_capatity"));
		lodge.setConvenient_facility((String)session.getAttribute("convenient_facility"));
		lodge.setLodge_addr((String)session.getAttribute("lodge_addr"));
		lodge.setLatitude((double)session.getAttribute("latitude"));
		lodge.setLongitude((double)session.getAttribute("longitude"));

		logger.info(lodge.toString());
			
		return "redirect:/host/manageLodge";
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
											String selectDisableDay, HttpSession session )
		{
			  
			 mav.setViewName("jsonView");
			 Date today = new Date();
			 SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
			 mav.addObject("today", date.format(today));
			
			  
			 Calendar cal = Calendar.getInstance ( );//오늘 날짜를 기준으루..
			 cal.add ( cal.MONTH, selectShowMonth ); //2개월 전....

			 mav.addObject("testDate", date.format(cal.getTime()));

			 session.setAttribute("available_term", selectShowMonth);
			 
			 
			
			 
			 Gson gson = new Gson();
			 Type type = new TypeToken<ArrayList<String>>(){}.getType();
	
			 
			 List<String> off_list = gson.fromJson(selectDisableDay,type);
			 
			 System.out.println(off_list);
			 
				 session.setAttribute("day_off_date", off_list);
		
			 
			 
			
			
			
			 return mav;
				
				}
		
		//1단계 요금설정
		@RequestMapping(value="/host/lodgeCharge", method=RequestMethod.GET)
		public void lodgeCharge() {
					
					
				}
				
		//1단계 요금설정
		@RequestMapping(value="/host/lodgeCharge", method=RequestMethod.POST)
		public @ResponseBody int  lodgeChargeProc(
												@RequestParam(defaultValue = "0")int inputCharge, 
												Model model,
												HttpSession session,
												String hour, String min,Lodge lodge,Day_off day_off
												) {
				
	
			int checkCharge = 0;
			System.out.println(inputCharge);
			if(inputCharge < 10000) {
				
				checkCharge = 1;

				
			}
			
			session.setAttribute("stay_cost", inputCharge);
			System.out.println("시간 :"+hour);
			System.out.println("분 : "+min);	
			System.out.println("세션에 저장된 요금 : " + session.getAttribute("stay_cost"));
			
			
			lodge.setBuilding_case_no((int)session.getAttribute("building_case_no"));
			lodge.setLodge_case_no((int)session.getAttribute("lodge_case_no"));
			lodge.setLodge_name((String)session.getAttribute("lodge_name"));
			lodge.setLodge_room((int)session.getAttribute("lodge_room"));
			lodge.setLodge_capacity((int)session.getAttribute("lodge_capatity"));
			lodge.setConvenient_facility((String)session.getAttribute("convenient_facility"));
			lodge.setLodge_addr((String)session.getAttribute("lodge_addr"));
			lodge.setLatitude((double)session.getAttribute("latitude"));
			lodge.setLongitude((double)session.getAttribute("longitude"));
			lodge.setStay_cost(inputCharge);
			
			//day_off
		List<String> d1 = (ArrayList<String>)session.getAttribute("day_off_date");
			
		System.out.println("d1"+d1);
		
		
			for(String d2 : d1 ) {
			java.sql.Date off_date3 = java.sql.Date.valueOf(d2); 
			System.out.println("d2"+off_date3);
			day_off.setDay_off_date(off_date3);						
//			hostService.insertFirst(day_off);
			}
			
			
			logger.info(lodge.toString());
			logger.info(day_off.toString());
			
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
