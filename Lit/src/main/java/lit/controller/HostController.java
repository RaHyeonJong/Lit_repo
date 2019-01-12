package lit.controller;

import java.io.Writer;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import lit.dto.Day_off;
import lit.dto.Image;
import lit.dto.Lodge;
import lit.dto.Member;
import lit.service.face.HostService;
import lit.service.face.LodgeService;

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
	public void hostFirst(Model model, int lodge_no) {
		
		
		model.addAttribute("lodge_no", lodge_no);
		
		
		
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
		
		
		logger.info(lodge.toString());
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
		
		logger.info(lodge.toString());

		session.setAttribute("lodge_addr", lodge.getLodge_addr());
		session.setAttribute("longitude", lodge.getLongitude());
		session.setAttribute("latitude", lodge.getLatitude());

		return "redirect:/host/firstConveniences";
	}
	
	//1단계 편의시설
	@RequestMapping(value="/host/firstConveniences", method=RequestMethod.GET)

	public void firstCon(Lodge lodge) {}


		
	//1단계 편의시설
	@RequestMapping(value="/host/firstConveniences", method=RequestMethod.POST)
	public String firstConproc(Lodge lodge,HttpSession session) {
		
		String[] word = lodge.getConvenient_facility().split(",");
		String[] otherCon = lodge.getConvenient_area().split(",");
		System.out.println(lodge.getConvenient_facility());
		
		
		for(String word2 : word) {

			List<String> word3 = Arrays.asList(word);
			
			String w = word3.stream().map(facility->""+facility+"")
					.collect(Collectors.joining(""));
			
			lodge.setConvenient_facility(w);
		}
		
		for(String otherCon1 : otherCon) {

			List<String> otherCon3 = Arrays.asList(otherCon);
			
			String t = otherCon3.stream().map(area->""+area+"")
					.collect(Collectors.joining(""));
			
			lodge.setConvenient_area(t);
		}
		
		
			session.setAttribute("convenient_facility", lodge.getConvenient_facility());
			session.setAttribute("convenient_area", lodge.getConvenient_area());
			logger.info(lodge.toString());
		return "redirect:/host/lodgeCharge";
		}
	
	
	
	//1단계 숙소관리
		@RequestMapping(value="/host/manageLodge", method=RequestMethod.GET)
		public void manageLodge(Model model, int lodge_no) {
			

			
			  Date today = new Date();
			  SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
			  
			  Calendar cal = Calendar.getInstance();
			  cal.add(Calendar.MONTH, 36);
			  
			  model.addAttribute("today", date.format(today));
			  model.addAttribute("after3years", date.format(cal.getTime()));
			  model.addAttribute("lodge_no", lodge_no);
		}
				
		//1단계 숙소관리
		@RequestMapping(value="/host/manageLodge", method=RequestMethod.POST)
		public ModelAndView manageLodgeProc(
				@RequestParam(defaultValue="1") int selectShowMonth, 
				ModelAndView mav,
				String selectDisableDay, 
				HttpSession session,
				int lodge_no)
		{
			hostService.deleteAllDayoff(lodge_no);
			
			 mav.setViewName("jsonView");
			 Date today = new Date();
			 
			 SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");//날짜형태

			 mav.addObject("today", date.format(today));//오늘날짜
			
			 //시작
			 Calendar cal = Calendar.getInstance ( );//오늘 날짜를 기준으루..
			 cal.add ( cal.MONTH, selectShowMonth ); //2개월 전....

			 mav.addObject("testDate", date.format(cal.getTime())); //끝나는날짜
			 
			 //끝

			 session.setAttribute("available_term", selectShowMonth);
			 
			 
			
			 
	
			 	
			 return mav;
				
				}
		
		@RequestMapping(value="/host/selectDayoff")
		public ModelAndView selectDayoffProc(
				Day_off day_off, 
				String selected_date, 
				String act, 
				ModelAndView mav) {
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
			Date day_off_date = null;
			try {
				day_off_date = dateFormat.parse(selected_date);
				day_off.setDay_off_date(day_off_date);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			if("insert".equals(act))
				hostService.insertSecond(day_off);
			else if("delete".equals(act))
				hostService.deleteDayoff(day_off);
			
			mav.setViewName("jsonView");
			
			return mav;
		}
		
		
		//1단계 요금설정
		@RequestMapping(value="/host/lodgeCharge", method=RequestMethod.GET)
		public void lodgeCharge() {
					
					
				}
				
		//1단계 요금설정
		@RequestMapping(value="/host/lodgeCharge", method=RequestMethod.POST)
		public ModelAndView lodgeChargeProc(
												Model model,
												HttpSession session,
												@RequestParam(defaultValue = "0")int check_in_hour, 
												@RequestParam(defaultValue = "0")int check_in_min,
												Lodge lodge,
												Day_off day_off, ModelAndView mav
												) {
			
			mav.setViewName("jsonView");
				
			System.out.println("체크인시간 :" +check_in_hour);
//			System.out.println("시간 :"+hour);
//			System.out.println("분 : "+min);	
//			session.setAttribute("check_in_time", hour+"시"+min+"분");
//			System.out.println(session.getAttribute("check_in_time"));
//			System.out.println("세션에 저장된 요금 : " + session.getAttribute("stay_cost"));
			session.setAttribute("check_in_time", check_in_hour+"시"+check_in_min+"분");
			System.out.println(session.getAttribute("check_in_time"));
			System.out.println("세션에 저장된 요금 : " + session.getAttribute("stay_cost"));

			
			lodge.setBuilding_case_no((int)session.getAttribute("building_case_no"));
			lodge.setLodge_case_no((int)session.getAttribute("lodge_case_no"));
			lodge.setLodge_name((String)session.getAttribute("lodge_name"));
			lodge.setLodge_room((int)session.getAttribute("lodge_room"));
			lodge.setLodge_capacity((int)session.getAttribute("lodge_capatity"));
			lodge.setConvenient_facility((String)session.getAttribute("convenient_facility"));
			lodge.setConvenient_area((String)session.getAttribute("convenient_area"));
			lodge.setLodge_addr((String)session.getAttribute("lodge_addr"));
			lodge.setLatitude((double)session.getAttribute("latitude"));
			lodge.setLongitude((double)session.getAttribute("longitude"));
			lodge.setCheck_in_time(check_in_hour+"시"+check_in_min+"분");
			
//			int member_no = ((Member) session.getAttribute("member")).getMem_no();
			
			lodge.setMem_no(5);

			logger.info(lodge.toString());

			hostService.insertFirst(lodge);
			System.out.println(lodge.getLodge_no());
			model.addAttribute("lodge_no", lodge.getLodge_no());
			
			return mav;
			
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
	@RequestMapping(value="/host/firstRoomF", method=RequestMethod.GET)
	public void hostElementFirstFix(Lodge lodge,Model model) {

		List<Lodge> hostLodgeElementList = hostService.viewHostElement(lodge);
		
		model.addAttribute("lodge_no",lodge.getLodge_no());
		
		model.addAttribute("fristUpdate", hostLodgeElementList);
		
	}
	
	//1단계 숙소정보 수정
	@RequestMapping(value="/host/firstRoomF", method=RequestMethod.POST)
	public ModelAndView hostElementFirstFixProc(Lodge lodge,ModelAndView mav) {
		
		 hostService.hostElementFirstFix(lodge);
		 mav.setViewName("jsonView");
		
			return mav;
		}
	
	//2단계 숙소정보 수정
	@RequestMapping(value="/host/hostSecondFix", method=RequestMethod.GET)
	public void hostElementSecondFix(Lodge lodge) {
		
		List<Lodge> hostLodgeElementList = hostService.viewHostElement(lodge);
	}
	
	//2단계 숙소정보 수정
	@RequestMapping(value="/host/hostSecondFix", method=RequestMethod.POST)
	public void hostElementSecondFixProc(Lodge lodge) {
		hostService.hostElementSecondFix(lodge);
	}
		
	
	//3단계 숙소정보 수정
	@RequestMapping(value="/host/hostThirdFix", method=RequestMethod.GET)
	public void hostElementThirdFix() {
		
//		List<Lodge> hostLodgeElementList = hostService.viewHostElement();
		
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

			
	//------------------숙소 이미지 추가하기
	@RequestMapping(value="/host/addview", method=RequestMethod.GET)
	public void hostAddView(Model model,int lodge_no) {
		model.addAttribute("lodge_no", lodge_no);
		
	}
	
	
	@RequestMapping(value="/host/addview", method=RequestMethod.POST)
	public void hostAddView(MultipartHttpServletRequest msr,HttpServletRequest req, Image image,int lodge_no,Model model) {
		
		image.setLodge_no(lodge_no);
		
		
		
		
//		hostService.hostaddViewList(msr,req,image);
	
		
		
		
	}
	

}
