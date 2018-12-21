package lit.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lit.dto.Board;
import lit.dto.Comment;
import lit.dto.Favorite;
import lit.dto.Member;
import lit.dto.Pay;
import lit.service.face.LoginService;
import lit.service.face.MypageService;

@Controller
public class MypageController {
	
	@Autowired LoginService loginService;
	@Autowired MypageService mypageService;
	
	@RequestMapping(value="/mypage/viewProfile")
	public void viewProfile(){}

	
	@RequestMapping(value="/mypage/update_profile", method=RequestMethod.GET)
	public void updateProfile(Model model, Member member) {
		member = loginService.getMember(member);
		
		model.addAttribute("member", member);
	}
	
	@RequestMapping(value="/mypage/update_profile", method=RequestMethod.POST)
	public String updateProfileProcess(Member member) {
		mypageService.updateProfile(member);
		
		return "redirect:/mypage/view_profile?mem_no="+member.getMem_no();
	}
	
	@RequestMapping(value="/mypage/view_favorite", method=RequestMethod.GET)
	public void viewFavorite(Model model, Member member) {
		List<Favorite> favorList = mypageService.getFavoriteList(member);
		
		model.addAttribute("favorList", favorList);
	}
	
	@RequestMapping(value="/mypage/delete_favorite", method=RequestMethod.POST)
	public String deleteFavorite(Member member, Favorite favorite) {
		mypageService.deleteFavorite(member, favorite);
		
		return "redirect:/mypage/view_favorite?mem_no="+member.getMem_no();
	}
	
	@RequestMapping(value="/mypage/view_mywriting")
	public void viewMywriting(Model model, Member member) {
		List<Board> boardList = mypageService.getMyboardList(member);
		List<Comment> commentList = mypageService.getMycommentList(member);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("commentList", commentList);
	}
	
	@RequestMapping(value="/mypage/view_pay")
	public void viewPay(Model model, Member member) {
		List<Pay> payList = mypageService.getPayList(member);
		
		model.addAttribute("payList", payList);
	}
	
	@RequestMapping(value="/mypage/update_pay")
	public String updatePay(Pay pay, Member member) {
		mypageService.updatePay(pay, member);
		
		return "redirect:/mypage/view_pay?mem_no="+member.getMem_no();
	}
	
}
