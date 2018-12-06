package lit.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lit.dto.Member;
import lit.service.face.JoinService;

@Controller
public class JoinController {
	
	@Autowired JoinService joinService;
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join() {
		return "join/join";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinProcess(Member member) {
		joinService.insertMember(member);
		
		return "join/result";
	}
	
	@RequestMapping(value="/join/checkId")
	public ModelAndView checkId(Member member) {
		ModelAndView mav = new ModelAndView();
		boolean existId = joinService.checkId(member);
		
		Map<String, Boolean> map = new HashMap<>();
		map.put("existId", existId);
		
		mav.addObject("map", map);
		mav.setViewName("jsonView");
		
		return mav;
	}
}
