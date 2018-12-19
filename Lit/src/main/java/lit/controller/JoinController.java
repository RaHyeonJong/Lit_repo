package lit.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lit.dto.Member;
import lit.service.face.JoinService;
import lit.util.SendSms;

@Controller
public class JoinController {
	
	@Autowired JoinService joinService;
		
	@RequestMapping(value="/join/checkId")
	public ModelAndView checkId(Member member) {
		ModelAndView mav = new ModelAndView();
		boolean existId = joinService.checkId(member);
		
		Map<String, Boolean> map = new HashMap<>();
		map.put("existId", existId);
		
		mav.addAllObjects(map);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value="/terms")
	public String viewTerms() {
		
		return "join/terms";
	}
	
	@RequestMapping(value="/join/smsCerti")
	public ModelAndView sendSms(String mem_phone) {
		ModelAndView mav = new ModelAndView();
		int ukey = SendSms.sendSms(mem_phone);
		
		Map<String, Integer> map = new HashMap<>();
		map.put("ukey", ukey);
		
		mav.addAllObjects(map);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value="/join/register")
	public ModelAndView joinMember(Member mem) {
//		joinService.insertMember(mem);
		
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<>();
		
		String result ="fail";
		
		result = "success";
		
		if(mem.getMem_no() != 0)
			result = "success";
		
		map.put("result", result);
		map.put("mem", mem);
		
		mav.addAllObjects(map);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value="/join/insertMyPhoto")
	public String insertMyPhoto() {
		
		
		return "redirect:/main";
	}
}
