package lit.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lit.dto.Festival;
import lit.dto.Lodge;
import lit.service.face.MainService;

@Controller
@RequestMapping("/main")
public class MainController {
	// 메인 페이지 컨트롤러

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Autowired
	MainService mainService;

	// 메인 페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public void main() {
		logger.info("메인 페이지 띄우기");

		// 추천 숙소 리스트
		List<Lodge> recommendLodgeList = mainService.getRecommendLodge();
		// 추천 행사 리스트
		List<Festival> recommendFestivalList = mainService.getRecommendFestivalList();

		// 도시별 추천 숙소, 행사 리스트 추가
	}

	// 메인 숙소 페이지
	@RequestMapping(value = "/lodge", method = RequestMethod.GET)
	public void mainLodge() {
		logger.info("메인 숙소 페이지 띄우기");

		// 최고 평점순 숙소 리스트
		List<Lodge> bestLodgeList = mainService.getBestLodgeList();

		// 서울 숙소 리스트
		List<Lodge> seoulLodgeList = mainService.getLocalLodgeList("seoul");

		// 부산 숙소 리스트
		List<Lodge> busanLodgeList = mainService.getLocalLodgeList("busan");
		
		// 제주 숙소 리스트
		List<Lodge> jejuLodgeList = mainService.getLocalLodgeList("jeju");
	}

	// 메인 행사 페이지
	@RequestMapping(value = "/festival", method = RequestMethod.GET)
	public void mainFestival() {
		logger.info("메인 행사 페이지 띄우기");

		// 최고 평점순 행사 리스트
		List<Lodge> bestFestivalList = mainService.getBestFestivalList();

		// 서울 행사 리스트
		List<Lodge> seoulFestivalList = mainService.getLocalFestivalList("seoul");

		// 부산 행사 리스트
		List<Lodge> busanFestivalList = mainService.getLocalFestivalList("busan");
		
		// 제주 행사 리스트
		List<Lodge> jejuFestivalList = mainService.getLocalFestivalList("jeju");
	}

	// 추천 숙소 페이지
	@RequestMapping(value = "/recommendLodge", method = RequestMethod.GET)
	public void recommendLodge() {
		logger.info("추천 숙소 페이지 띄우기");
	}

	// 추천 행사 페이지
	@RequestMapping(value = "/recommendFestival", method = RequestMethod.GET)
	public void recommendFestival() {
		logger.info("추천 행사 페이지 띄우기");
	}

}
