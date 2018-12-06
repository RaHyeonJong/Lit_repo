package lit.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lit.dto.Festival;
import lit.dto.Lodge;
import lit.service.face.SearchService;

@Controller
@RequestMapping("/search")
public class SearchController {

	// 검색 결과 페이지

	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);

	@Autowired
	SearchService searchService;

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void searchMain(String location) {
		logger.info("지역 검색 결과 페이지 띄우기");

		// 지역 숙소 리스트
		List<Lodge> localLodgeList = searchService.getLocalLodgeList(location);
		// 지역 행사 리스트
		List<Festival> localFestivalList = searchService.getLocalFestivalList(location);
		// 테마별 행사 추천 리스트
	}

	@RequestMapping(value = "/lodge", method = RequestMethod.GET)
	public void searchLodge(String location) {
		logger.info("지역 숙소 검색 결과 페이지 띄우기");

		// 지역 숙소 리스트
		List<Lodge> localLodgeList = searchService.getLocalLodgeList(location);
	}

	@RequestMapping(value = "/festival", method = RequestMethod.GET)
	public void searchFestival(String location) {
		logger.info("지역 행사 결과 페이지 띄우기");

		// 지역 행사 리스트
		List<Festival> localFestivalList = searchService.getLocalFestivalList(location);
	}

	// 추후 수정 해야함
	// 임시로 만들어 놨음
	@RequestMapping(value = "/ajaxFilter")
	public @ResponseBody List searchFilterAjax(Lodge filter) {
		logger.info("숙소 필터가 바뀔때 마다 작동하는 ajax 메소드");

		// 숙소 필터 리스트
		List<Lodge> filterLodgeList = searchService.getFilterLodgeList(filter);

		return filterLodgeList;
	}

	// 추후 수정 해야함
	// 임시로 만들어 놨음
	@RequestMapping(value = "/ajaxMap")
	public @ResponseBody List localMapAjax(String location) {
		logger.info("map의 이동 때 마다 ajax로 숙소 리스트 가져오는 메소드");

		// 지역 숙소 리스트
		List<Lodge> localLodgeList = searchService.getLocalLodgeList(location);

		return localLodgeList;
	}
}
