package lit.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import lit.dto.Board;
import lit.dto.Comment;
import lit.dto.Favorite;
import lit.dto.Member;
import lit.dto.Pay;
import lit.service.face.LoginService;
import lit.service.face.MypageService;
import lit.util.Paging;

@Controller
public class MypageController {
	
	@Autowired ServletContext context;
	@Autowired LoginService loginService;
	@Autowired MypageService mypageService;
	
	@RequestMapping(value="/mypage/main")
	public void mypageMain() {}
	
	@RequestMapping(value="/mypage/viewMyProfile")
	public void viewMyProfile() {}

	@RequestMapping(value="/mypage/updateMyProfile", method=RequestMethod.GET)
	public void updateMyProfile() {}
	
	@RequestMapping(value="/mypage/updateMyProfile", method=RequestMethod.POST)
	public String updateProfileProcess(
			MultipartFile file, 
			HttpSession session,
			@RequestParam(value="name-for-update") String mem_name,
			@RequestParam(value="pw-for-update") String mem_pw,
			@RequestParam(value="mem-phone-for-update") String mem_phone,
			@RequestParam(value="intro-for-update") String mem_intro	) {
				
		Member mem = new Member();
		mem.setMem_no(((Member)session.getAttribute("member")).getMem_no());
		mem.setMem_name(mem_name);
		mem.setMem_pw(mem_pw);
		mem.setMem_phone(mem_phone);
		mem.setMem_intro(mem_intro);
		
		mypageService.updateProfile(context, file, mem);
		mem = mypageService.getMemberByNo(mem);
		
		session.setAttribute("member", mem);
		
		return "redirect:/mypage/main";
	}
	
	@RequestMapping(value="/mypage/viewMyContents")
	public void viewMyContents(
			Model model, 
			HttpSession session,
			@RequestParam(defaultValue="1") int curPage ) {
		
		int mem_no = ((Member)session.getAttribute("member")).getMem_no();
		int totalCount = mypageService.getTotalCommCnt(mem_no);
		
		Paging paging = new Paging(totalCount, curPage, 10, 10);
		paging.setMem_no(mem_no);
				
		List<Comment> commList = mypageService.getCommentList(paging);
		
		model.addAttribute("commList", commList);
		model.addAttribute("paging", paging);
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
