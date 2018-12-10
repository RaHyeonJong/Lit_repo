package lit.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lit.dto.Member;
import lit.service.face.LoginService;

@Controller
public class LoginController {

	@Autowired LoginService loginService;
	
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
	
	@RequestMapping(value="/login/findId")
	public String findId(Model model, Member member) {
		boolean existId = loginService.findId(member);
		
		if(existId) {
			member = loginService.getId(member);
			model.addAttribute("existId", true);
			model.addAttribute("member", member);
		}else {
			model.addAttribute("existId", false);
		}
		
		return "login/findId_result";
	}
	
	@RequestMapping(value="/login/findPw")
	public String findPw(Model model, Member member) {
		boolean existAccount = loginService.checkMembership(member);
		
		if(existAccount) {
			member = loginService.getMember(member);
			model.addAttribute("existAccount", true);
			model.addAttribute("member", member);
		}else {
			model.addAttribute("existAccount", false);
			model.addAttribute("non-acc", "계정이 존재하지 않습니다. 아이디, 비밀번호를 다시 확인해주세요.");
		}
		
		return "login/findPw_result";
	}
	
	@GetMapping(value="/logout")
	public String logout(HttpSession session) { 
		session.invalidate();
		
		return "redirect:/tempmain";
	}
}
