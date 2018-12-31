package lit.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

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
		
		
//		// 추천 숙소 리스트
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
		
		return "main/main";
	}
	
	// 메인 페이지
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String main(Model model,
			@RequestParam(required=false, defaultValue="") String location, 
			@RequestParam(required=false, defaultValue="") String checkin, 
			@RequestParam(required=false, defaultValue="") String checkout, 
			@RequestParam(required=false, defaultValue="") int people, 
			@RequestParam(required=false, defaultValue="") String cityLat, 
			@RequestParam(required=false, defaultValue="") String cityLng
			
			) {
		
		logger.info("메인 페이지 띄우기");
		
		System.out.println(location);
		System.out.println(checkin);
		System.out.println(checkout);
		System.out.println(people);
		System.out.println(cityLat);
		System.out.println(cityLng);
		
		

//		// 추천 숙소 리스트
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
		
		model.addAttribute("cityLat", cityLat);
		model.addAttribute("cityLng", cityLng);
		
		
		return "main/main";
	}

	// 메인 숙소 페이지
	@RequestMapping(value = "/lodge", method = RequestMethod.GET)
	public void mainLodge(Model model) {
		logger.info("메인 숙소 페이지 띄우기");

		// 최고 평점순 숙소 리스트
		List<Lodge> bestLodgeList = mainService.getBestLodgeList();

		// 서울 숙소 리스트
		List<Lodge> seoulLodgeList = mainService.getLocalLodgeList("seoul");

		// 부산 숙소 리스트
		List<Lodge> busanLodgeList = mainService.getLocalLodgeList("busan");
		
		// 제주 숙소 리스트
		List<Lodge> jejuLodgeList = mainService.getLocalLodgeList("jeju");
		
		model.addAttribute("bestLodgeList", bestLodgeList);
		model.addAttribute("seoulLodgeList", seoulLodgeList);
		model.addAttribute("busanLodgeList", busanLodgeList);
		model.addAttribute("jejuLodgeList", jejuLodgeList);
	}

	// 메인 행사 페이지
	@RequestMapping(value = "/festival", method = RequestMethod.GET)
	public void mainFestival(Model model) {
		logger.info("메인 행사 페이지 띄우기");

		// 최고 평점순 행사 리스트
		List<Festival> bestFestivalList = mainService.getBestFestivalList();

		// 서울 행사 리스트
		List<Festival> seoulFestivalList = mainService.getLocalFestivalList("seoul");

		// 부산 행사 리스트
		List<Festival> busanFestivalList = mainService.getLocalFestivalList("busan");
		
		// 제주 행사 리스트
		List<Festival> jejuFestivalList = mainService.getLocalFestivalList("jeju");
		
		model.addAttribute("bestFestivalList", bestFestivalList);
		model.addAttribute("seoulFestivalList", seoulFestivalList);
		model.addAttribute("busanFestivalList", busanFestivalList);
		model.addAttribute("jejuFestivalList", jejuFestivalList);
	}

	@RequestMapping(value="/lodgeListAjax")
	public @ResponseBody List lodgeAjax(MapBounds bounds
			) {
		
		System.out.println(bounds);
		
		bounds.setNeLat2( Double.parseDouble( bounds.getNeLat()));
		bounds.setNeLng2( Double.parseDouble( bounds.getNeLng()));
		bounds.setSwLat2( Double.parseDouble( bounds.getSwLat()));
		bounds.setSwLng2( Double.parseDouble( bounds.getSwLng()));
		System.out.println(bounds);
		////////marker test //////////////
		
//		List<Lodge> lodgeList = mainService.getLodgeList(); // 전체 숙소 리스트
		List<Lodge> lodgeList = mainService.getLodgeListByBounds(bounds); // bounds 숙소 리스트
		
		
		
		///////////////////////////////////
		
		
		
		
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
			SearchFilter searchFilter, double neLat, double neLng, double swLat, double swLng
			) { 
		System.out.println("search ajax");
		System.out.println(searchFilter);
		
		List<Lodge> lodgeList = mainService.getSearchList(searchFilter);
		
		return lodgeList;
	}
	
}