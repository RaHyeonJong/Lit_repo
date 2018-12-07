package lit.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lit.dto.Comment;
import lit.dto.Lodge;
import lit.dto.LodgeSearch;
import lit.service.face.LogoService;

@Controller
@RequestMapping("/logo")
public class LogoController {

	private static final Logger logger = LoggerFactory.getLogger(LogoController.class);
	
	@Autowired LogoService logoService;

	// 로고 페이지
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void logo(Model model) {
		logger.info("로고 페이지 띄우기");
		
		// 후기 가져오는 서비스
		List<Comment> reviewList = logoService.getReviewList();
		
		model.addAttribute("reviewList", reviewList);
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String logoSearch(Model model, LodgeSearch search) {
		// 로고 페이지에서 검색하기

		List<Lodge> lodgeList = logoService.getLodgeList(search); // 지역 숙소 결과 가져오는 서비스
		
		model.addAttribute("lodgeList", lodgeList);
		
		return "/search/lodge";
	}
	
	@RequestMapping(value = "/searchLocationAjax", method = RequestMethod.GET)
	public @ResponseBody List<String> logoSearch_ajax(String location) {
		// 검색에서 지역 검색어 추천 보여주는 ajax
		
		List<String> ajax = logoService.getLocationAjaxList(location);
		
		return ajax;
	}

	
	

}
