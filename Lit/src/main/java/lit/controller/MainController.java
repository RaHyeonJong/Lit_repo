package lit.controller;

import java.io.IOException;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;

import lit.dto.Festival;
import lit.dto.Lodge;
import lit.dto.MapBounds;
import lit.dto.SearchFilter;
import lit.service.face.MainService;

@Controller
@RequestMapping("/main")
public class MainController {
	// 메인 페이지 컨트롤러

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Autowired
	MainService mainService;

	// 메인 페이지
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String getMain(Model model) {
		
		logger.info("메인 페이지 띄우기");
		
		
		
		// 추천 숙소 리스트
//		List<Lodge> recommendLodgeList = mainService.getPagingLodge(1); // 추천 숙소 6개 가져오는 메소드
		// 가장 많이 찜한 숙소 리스트
//		List<Lodge> favoriteLodgeList = mainService.getPagingLodge(2);
//		// 추천 행사 리스트
//		List<Festival> recommendFestivalList = mainService.getRecommendFestivalList();
//
//		// 테마별 숙소 리스트
//		List<Lodge> themeLodgeList = mainService.getThemeLodgeList("");
//		// 테마별 행사 리스트
//		List<Festival> themeFestivalList = mainService.getThemeFestivalList("");
		
		
		
//		for(int i=0;i<lodgeList.size();i++) {
//			String[] imageArray = mainService.getLodgeImageName(lodgeList.get(i).getLodge_no());
//			lodgeList.get(i).setStored_name(imageArray);
//		}
		
		
		List<Lodge> lodgeList = mainService.getLodgeList(1); // 9개씩
		
		List<Festival> festivalList = mainService.getRecommendFestivalList(1); // 4개씩
		
		// ImageName 넣기
		for(int i=0;i<lodgeList.size();i++) { 
			String[] imageArray = mainService.getLodgeImageName(lodgeList.get(i).getLodge_no());
			lodgeList.get(i).setStored_name(imageArray);
		}
		
		// 행사 리스트에 stored_name 입력
		for(int i=0;i<festivalList.size();i++) {
			String imageName = mainService.getFestivalImageName(festivalList.get(i).getFestival_no());
			festivalList.get(i).setStored_name(imageName);
		}
		
		System.out.println(festivalList);
		
		model.addAttribute("lodgeList", lodgeList); // 추천 숙소 리스트
		model.addAttribute("festivalList", festivalList);  // 가장 많이 찜한 숙소 리스트
//		model.addAttribute("recommendFestivalList", recommendFestivalList);
//		model.addAttribute("themeLodgeList", themeLodgeList);
//		model.addAttribute("themeFestivalList", themeFestivalList);
		
		return "/main/main";
	}
	
	// 메인 페이지
	@RequestMapping(value = "/searchMain", method = RequestMethod.POST)
	public String main(Model model,
			SearchFilter searchFilter
			
			) {
		
		logger.info("메인 페이지 띄우기");
		int people_num = 0;
//		if(people != null) {
//			people_num = Integer.parseInt(people);
//		}
//		System.out.println(location);
//		System.out.println(checkin);
//		System.out.println(checkout);
//		System.out.println(people);
//		System.out.println(people_num);
//		System.out.println(cityLat);
//		System.out.println(cityLng);
		
		

		// 추천 숙소 리스트
//		List<Lodge> recommendLodgeList = mainService.getRecommendLodge();
//		// 추천 행사 리스트
//		List<Festival> recommendFestivalList = mainService.getRecommendFestivalList();
//
//		// 테마별 숙소 리스트
//		List<Lodge> themeLodgeList = mainService.getThemeLodgeList("");
//		// 테마별 행사 리스트
//		List<Festival> themeFestivalList = mainService.getThemeFestivalList("");
		
		// 도시별 추천 숙소, 행사 리스트 추가
		
//		model.addAttribute("recommendLodgeList", recommendLodgeList);
//		model.addAttribute("recommendFestivalList", recommendFestivalList);
//		model.addAttribute("themeLodgeList", themeLodgeList);
//		model.addAttribute("themeFestivalList", themeFestivalList);
		
		model.addAttribute("cityLat", searchFilter.getCityLat());
		model.addAttribute("cityLng", searchFilter.getCityLng());
		
		return "/main/searchMain";
	}

	// 메인 숙소 페이지
	@RequestMapping(value = "/lodge", method = RequestMethod.GET)
	public void mainLodge(Model model) {
		logger.info("메인 숙소 페이지 띄우기");

//		// 최고 평점순 숙소 리스트
//		List<Lodge> bestLodgeList = mainService.getBestLodgeList();
//
//		// 서울 숙소 리스트
//		List<Lodge> seoulLodgeList = mainService.getLocalLodgeList("seoul");
//
//		// 부산 숙소 리스트
//		List<Lodge> busanLodgeList = mainService.getLocalLodgeList("busan");
//		
//		// 제주 숙소 리스트
//		List<Lodge> jejuLodgeList = mainService.getLocalLodgeList("jeju");
//		
//		model.addAttribute("bestLodgeList", bestLodgeList);
//		model.addAttribute("seoulLodgeList", seoulLodgeList);
//		model.addAttribute("busanLodgeList", busanLodgeList);
//		model.addAttribute("jejuLodgeList", jejuLodgeList);
	}

	// 메인 행사 페이지
	@RequestMapping(value = "/festival", method = RequestMethod.GET)
	public void mainFestival(Model model) {
		logger.info("메인 행사 페이지 띄우기");

//		// 최고 평점순 행사 리스트
//		List<Festival> bestFestivalList = mainService.getBestFestivalList();
//
//		// 서울 행사 리스트
//		List<Festival> seoulFestivalList = mainService.getLocalFestivalList("seoul");
//
//		// 부산 행사 리스트
//		List<Festival> busanFestivalList = mainService.getLocalFestivalList("busan");
//		
//		// 제주 행사 리스트
//		List<Festival> jejuFestivalList = mainService.getLocalFestivalList("jeju");
//		
//		model.addAttribute("bestFestivalList", bestFestivalList);
//		model.addAttribute("seoulFestivalList", seoulFestivalList);
//		model.addAttribute("busanFestivalList", busanFestivalList);
//		model.addAttribute("jejuFestivalList", jejuFestivalList);
	}

	@RequestMapping(value="/lodgeListAjax")
	public @ResponseBody List lodgeAjax(String searchFilterJson
			) {
		
		System.out.println("test11");
		System.out.println(searchFilterJson); // searchFilter String 출력
		
		ObjectMapper mapper = new ObjectMapper();
		SearchFilter searchFilter = new SearchFilter();
		
		try {
			searchFilter = mapper.readValue(searchFilterJson, SearchFilter.class);
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		System.out.println(searchFilter); // json String to Object(MapBounds)
		////////marker test //////////////
		
//		List<Lodge> lodgeList = mainService.getLodgeList(); // 전체 숙소 리스트
		List<Lodge> lodgeList = mainService.getLodgeListByBounds(searchFilter); // bounds 숙소 리스트(항상 필터 적용)
		
		for(int i=0;i<lodgeList.size();i++) { // ImageName 넣기
			String[] imageArray = mainService.getLodgeImageName(lodgeList.get(i).getLodge_no());
			lodgeList.get(i).setStored_name(imageArray);
		}
		///////////////////////////////////
		
		System.out.println(lodgeList.get(0).toString());
		
		
		return lodgeList;
	}
	
	@RequestMapping(value="/lodgeListAjax", method = RequestMethod.POST)
	public void lodgeListAjax(String list, Model model) {
		System.out.println("ajax post");
		
		List<Lodge> lodgeList = new ArrayList<Lodge>();
		
		ObjectMapper objectMapper = new ObjectMapper();
		TypeFactory typeFactory = objectMapper.getTypeFactory();
		
		try {
			lodgeList = objectMapper.readValue(list, typeFactory.constructCollectionType(List.class, Lodge.class));
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		logger.info(lodgeList.toString());
		
		model.addAttribute("list", lodgeList);
	}
	
	@RequestMapping(value="/searchFilterAjax", method = RequestMethod.POST)
	public @ResponseBody List searchFilterAjax(
			String searchFilterJson
			) { 
		
		Date today = new Date();
		Date startDate2 = null;
		Date endDate2 = null;
		
		
		
		System.out.println("search ajax");
		System.out.println(searchFilterJson);
		
		ObjectMapper mapper = new ObjectMapper();
		SearchFilter searchFilter = new SearchFilter();
		
		try {
			searchFilter = mapper.readValue(searchFilterJson, SearchFilter.class);
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(searchFilter.getCate());
		
		SimpleDateFormat dt = new SimpleDateFormat("mm/dd/yyyy"); 
		
		try {
			if(!"".equals(searchFilter.getStartDate())) {
				startDate2 = dt.parse(searchFilter.getStartDate());
				endDate2 =  dt.parse(searchFilter.getEndDate());
			} else {
				startDate2 = new Date();
				endDate2 = new Date();
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		System.out.println("date");
		System.out.println(startDate2);
		System.out.println(endDate2);
		
		System.out.println(searchFilter);
		searchFilter.setMaxPrice(999999);
		
		
		
		List<Lodge> lodgeList2 = mainService.getLodgeListByBounds(searchFilter); // 필터 적용 리스트 가져오기
		
		List<Lodge> lodgeList = new ArrayList<>();
		
		for(Lodge l:lodgeList2) {
			int term = l.getAvailable_term();
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.MONTH, term);
			
			Date startTerm = today;
			Date endTerm = cal.getTime();
			
			System.out.println("=========");
			System.out.println(startTerm.getTime());
			System.out.println(startDate2.getTime());
			
			if(startDate2.getTime() >= startTerm.getTime() && endDate2.getTime() <= endTerm.getTime()) {
				if(searchFilter.getCate().length == 0) {
					lodgeList.add(l);
				} else {
					for(int i : searchFilter.getCate()) {
						if(l.getLodge_case_no() == i) {
							lodgeList.add(l);
						}
					}
				}
				
			}
			
		}
		
		System.out.println("date1 : " + lodgeList2.size());
		System.out.println("date2 : " + lodgeList.size());
		
		for(int i=0;i<lodgeList.size();i++) {
			String[] imageArray = mainService.getLodgeImageName(lodgeList.get(i).getLodge_no());
			lodgeList.get(i).setStored_name(imageArray);
		}
		
		return lodgeList;
	}
	
	@RequestMapping(value="/mainAjax", method = RequestMethod.POST)
	public String mainAjax(int page, Model model) {
		
		int index = (page % 10) + 2;
		
		
		
		String[] lodgeComment = {"1", "2", "3","4", "5", "6", "7", "8", "9", "10", "11", "12", "13","14", "15", "16", "17", "18", "19", "20"};
		
		String[] festivalComment = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j"};
		
		List<Lodge> lodgeList = mainService.getLodgeList(page); // 9개씩
		
		List<Festival> festivalList = mainService.getRecommendFestivalList(page); // 4개씩
		
		// 행사 리스트에 stored_name 입력
		for(int i=0;i<festivalList.size();i++) {
			String imageName = mainService.getFestivalImageName(festivalList.get(i).getFestival_no());
			festivalList.get(i).setStored_name(imageName);
		}
		
		logger.info(lodgeList.toString());
		
		model.addAttribute("lodgeList", lodgeList);
		model.addAttribute("festivalList", festivalList);
		model.addAttribute("lodgeComment1", lodgeComment[(index-2)*2]);
		model.addAttribute("lodgeComment2", lodgeComment[(index-2)*2 + 1]);		
		model.addAttribute("festivalComment", festivalComment[index-2]);
		
		return "/main/mainAjax";
	}
	
}