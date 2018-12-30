package lit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import lit.dto.Comment;
import lit.dto.Favorite;
import lit.dto.Lodge;
import lit.dto.Member;
import lit.dto.Pay;
import lit.dto.Report;
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
	
	@RequestMapping(value="/mypage/viewMyFavorites", method=RequestMethod.GET)
	public void viewMyFavorites(
			Model model,
			HttpSession session,
			@RequestParam(defaultValue="1") int curPage ) {
		
		int mem_no = ((Member)session.getAttribute("member")).getMem_no();
		int totalCount = mypageService.getTotalFavorCnt(mem_no);
		
		Paging paging = new Paging(totalCount, curPage, 10, 10);
		paging.setMem_no(mem_no);
		
		List<Favorite> favorList = mypageService.getFavorList(paging);
		
		model.addAttribute("favorList", favorList);
		model.addAttribute("paging", paging);
	}
	
	@RequestMapping(value="/mypage/deleteMyFavorites", method=RequestMethod.POST)
	public String deleteMyFavorites(
			Model model,
			HttpSession session,
			Favorite favor,
			@RequestParam(defaultValue="1") int curPage ) {
		
		int mem_no = ((Member)session.getAttribute("member")).getMem_no();
		favor.setMem_no(mem_no);
		
		mypageService.deleteMyFavor(favor);
		
		int totalCount = mypageService.getTotalFavorCnt(mem_no);
		
		Paging paging = new Paging(totalCount, curPage, 10, 10);
		paging.setMem_no(mem_no);
		
		List<Favorite> favorList = mypageService.getFavorList(paging);
		
		model.addAttribute("favorList", favorList);
		model.addAttribute("paging", paging);
		
		return "mypage/viewMyFavorites";
	}
	
	@RequestMapping(value="/mypage/viewMyPayments", method=RequestMethod.GET)
	public void viewMyPayments(
			Model model,
			HttpSession session,
			@RequestParam(defaultValue="1") int curPage ) {
		
		int mem_no = ((Member)session.getAttribute("member")).getMem_no();
		int totalCount = mypageService.getTotalPayCnt(mem_no);
		
		Paging paging = new Paging(totalCount, curPage, 5, 10);
		paging.setMem_no(mem_no);
		
		List<Pay> payList = mypageService.getPayList(paging);
		
		model.addAttribute("payList", payList);
		model.addAttribute("paging", paging);
	}
	
	@RequestMapping(value="/mypage/cancelPayment", method=RequestMethod.POST)
	public String cancelPayment(
			Pay pay,
			Model model,
			HttpSession session,
			@RequestParam(defaultValue="1") int curPage ) {
		
		mypageService.cancelPayment(pay);
		
		int mem_no = ((Member)session.getAttribute("member")).getMem_no();
		int totalCount = mypageService.getTotalPayCnt(mem_no);
		
		Paging paging = new Paging(totalCount, curPage, 5, 10);
		paging.setMem_no(mem_no);
		
		List<Pay> payList = mypageService.getPayList(paging);
		
		model.addAttribute("payList", payList);
		model.addAttribute("paging", paging);
		
		return "mypage/viewMyPayments";
	}
	
	@RequestMapping(value="/mypage/viewPayDetail")
	public void viewPayDetail(Model model, Pay pay, Lodge lodge, Member host) {
		pay = mypageService.getPay(pay);
		lodge = mypageService.getLodge(pay);
		host = mypageService.getHost(lodge);
		
		model.addAttribute("pay", pay);
		model.addAttribute("lodge", lodge);
		model.addAttribute("host", host);
	}
	
	@RequestMapping(value="/mypage/deleteMember", method=RequestMethod.GET)
	public void deleteMember() {}
	
	@RequestMapping(value="/mypage/deleteMember", method=RequestMethod.POST)
	public void deleteMemberProcess(Member mem, HttpServletResponse resp, HttpSession session) {
		PrintWriter writer = null;
			
		try {
			writer = resp.getWriter();
			
			boolean existAccount = loginService.checkMembership(mem);
			
			if(existAccount) {
				mypageService.deleteMember(mem);
				session.invalidate();
				writer.write("1");
			} else {
				writer.write("-1");
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if(writer != null) writer.close();
		}		
	}
	
	@RequestMapping(value="/viewProfile")
	public String viewOtherProfile(Model model, int mem_no) {
		Member other = new Member();
		other.setMem_no(mem_no);
		
		other = mypageService.getMemberByNo(other);
		System.out.println(other);
		
		model.addAttribute("other", other);
		
		return "mypage/viewOtherProfile";
	}
	
	@RequestMapping(value="/reportMember")
	public void reportMember(Report report, HttpServletResponse resp) {
		PrintWriter writer = null;
			
		try {
			writer = resp.getWriter();
			
			boolean alreadyReport = mypageService.checkReport(report);
			
			if(!alreadyReport) {
				mypageService.reportMember(report);
				writer.write("1");
			} else {
				writer.write("-1");
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if(writer != null) writer.close();
		}		
	}
	
}
