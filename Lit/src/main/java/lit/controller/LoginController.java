package lit.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lit.dto.Member;
import lit.service.face.LoginService;

@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired LoginService loginService;
	
	@RequestMapping(value="/test")
	public void test() {
		
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public ModelAndView loginProcess(Member member, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> resultMap = new HashMap<>();
		
		boolean existAccount = loginService.checkMembership(member);
		
		if(existAccount) {
			member = loginService.getMember(member);
			session.setAttribute("login", true);
			session.setAttribute("member", member);
			
			resultMap.put("login", true);
		} else {
			resultMap.put("login", false);
		}
		mav.addAllObjects(resultMap);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value="/login/findpw", method=RequestMethod.POST)
	public ModelAndView findPw(Member member) {		
		ModelAndView mav = new ModelAndView();
		Map<String, Object> resultMap = new HashMap<>();
		
		boolean existEmail = loginService.checkEmail(member);
		
		if(existEmail) {
			member = loginService.getMember(member);
			resultMap.put("existEmail", true);

			loginService.sendMail(member);
			
		}else {
			resultMap.put("existEmail", false);
		}
		mav.addAllObjects(resultMap);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@GetMapping(value="/logout")
	public String logout(HttpSession session) { 
		session.invalidate();
		
		return "redirect:/tempmain";
	}
	
}