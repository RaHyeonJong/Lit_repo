package lit.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lit.dto.Board;
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
	public void main(Model model) {
		logger.info("메인 페이지 띄우기");

		// 추천 숙소 리스트
		List<Lodge> recommendLodgeList = mainService.getRecommendLodge();
		// 추천 행사 리스트
<<<<<<< HEAD
		List<Board> recommendEventList = mainService.getRecommendEventList();
=======
		List<Festival> recommendFestivalList = mainService.getRecommendFestivalList();
>>>>>>> branch 'master' of https://github.com/RaHyeonJong/Lit_repo.git

		// 테마별 숙소 리스트
		List<Lodge> themeLodgeList = mainService.getThemeLodgeList("");
		// 테마별 행사 리스트
<<<<<<< HEAD
		List<Lodge> themeEventList = mainService.getThemeEventList("");
=======
		List<Festival> themeFestivalList = mainService.getThemeFestivalList("");
>>>>>>> branch 'master' of https://github.com/RaHyeonJong/Lit_repo.git
		
		// 도시별 추천 숙소, 행사 리스트 추가
		
		model.addAttribute("recommendLodgeList", recommendLodgeList);
		model.addAttribute("recommendEventList", recommendEventList);
		model.addAttribute("themeLodgeList", themeLodgeList);
		model.addAttribute("themeEventList", themeEventList);
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
	@RequestMapping(value = "/event", method = RequestMethod.GET)
	public void mainEvent(Model model) {
		logger.info("메인 행사 페이지 띄우기");

		// 최고 평점순 행사 리스트
<<<<<<< HEAD
		List<Festival> bestEventList = mainService.getBestEventList();
=======
		List<Festival> bestFestivalList = mainService.getBestFestivalList();
>>>>>>> branch 'master' of https://github.com/RaHyeonJong/Lit_repo.git

		// 서울 행사 리스트
<<<<<<< HEAD
		List<Board> seoulEventList = mainService.getLocalEventList("seoul");
=======
		List<Festival> seoulFestivalList = mainService.getLocalFestivalList("seoul");
>>>>>>> branch 'master' of https://github.com/RaHyeonJong/Lit_repo.git

		// 부산 행사 리스트
<<<<<<< HEAD
		List<Board> busanEventList = mainService.getLocalEventList("busan");
=======
		List<Festival> busanFestivalList = mainService.getLocalFestivalList("busan");
>>>>>>> branch 'master' of https://github.com/RaHyeonJong/Lit_repo.git
		
		// 제주 행사 리스트
<<<<<<< HEAD
		List<Board> jejuEventList = mainService.getLocalEventList("jeju");
=======
		List<Festival> jejuFestivalList = mainService.getLocalFestivalList("jeju");
>>>>>>> branch 'master' of https://github.com/RaHyeonJong/Lit_repo.git
		
		model.addAttribute("bestEventList", bestEventList);
		model.addAttribute("seoulEventList", seoulEventList);
		model.addAttribute("busanEventList", busanEventList);
		model.addAttribute("jejuEventList", jejuEventList);
	}

}
