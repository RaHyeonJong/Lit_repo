package lit.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lit.dto.Board;
import lit.dto.Comment;
import lit.dto.Festival;
import lit.dto.Image;
import lit.dto.Lodge;
import lit.dto.Member;
import lit.dto.Pay;
import lit.dto.Report;
import lit.service.face.AdminService;
import lit.util.Paging;



@Controller
public class AdminController {
	
	@Autowired AdminService adminService;
	@Autowired ServletContext context;
	
	@RequestMapping(value="/admin/layout/header", method=RequestMethod.GET)
	public void adminMain( ) {
		
		// 관리자 메인페이지보이기		
		
	}
	
	
	// --------------------- 회원관리 ---------------------
	
	
	// 멤버 리스트 보이기 	
	@RequestMapping(value="/admin/member", method=RequestMethod.GET)
	public void adminMemberList(
			Model model, 
			@RequestParam(required=false, defaultValue="0") int curPage,
			@RequestParam(required=false, defaultValue="10") int listCount,
			@RequestParam(required=false, defaultValue="10") int pageCount,
			@RequestParam(defaultValue="1") int mem_case_no ) {
		
		
		Paging paging = adminService.getMemberPaging(curPage, listCount, pageCount, mem_case_no);
		paging.setMem_case_no(mem_case_no);
		
		model.addAttribute("paging", paging);
		
		List<Member> memberList = adminService.memberList(paging);
		model.addAttribute("memberList", memberList);
		
	}

	
	// 멤버 상세 정보 보이기 
	
	@RequestMapping(value="/admin/memberView", method=RequestMethod.GET)
	public void memberView (Model model, int mem_no) { 
		
		Member memberView = adminService.viewMember(mem_no);
		model.addAttribute("memberView", memberView);
	}
	
	
	// --------------------- 숙소 관리 ---------------------
	
	// 숙소리스트 보이기
	
	@RequestMapping(value="/admin/lodge", method=RequestMethod.GET)
	public String adminLogeList (
		     Model model,
		     @RequestParam(required=false, defaultValue="0") int curPage,
		     @RequestParam(required=false, defaultValue="10") int listCount,
		     @RequestParam(required=false, defaultValue="10") int pageCount,
		     @RequestParam(defaultValue="0") int lodge_activation
			
			) { 
		
		Paging paging = adminService.getLodgePaging(curPage, listCount, pageCount, lodge_activation);
        paging.setLodge_activation(lodge_activation);
        
		model.addAttribute("paging", paging);
		
		List<Lodge> adminLodgelist = adminService.getLudgeList(paging);
		model.addAttribute("adminLodgeList", adminLodgelist);
		
		return "admin/lodge";
		
	} 
	
	// 숙소 활성 시키기 
	
	@RequestMapping(value="/admin/lodgeActive", method=RequestMethod.GET)
	public String adminLodgeActiveResult(int lodge_no ) { 
		
		adminService.lodgeActivaiton(lodge_no);
		return "redirect:/admin/lodge";
	}
		
	
	// -------------------- 고객문의 관리 -------------------- 
	
	 // 고객문의 리스트 보이기
	
	@RequestMapping(value="/admin/csList", method=RequestMethod.GET)
	public void csList (
		     Model model,
		     @RequestParam(required=false, defaultValue="0") int curPage,
		     @RequestParam(required=false, defaultValue="10") int listCount,
		     @RequestParam(required=false, defaultValue="10") int pageCount,
		     @RequestParam(defaultValue="0") int answer
			
			) {

		Paging paging = adminService.getCsPaging(curPage, listCount, pageCount,answer);
		paging.setAnswer(answer);
		model.addAttribute("paging", paging);
		
		List<Board> csList = adminService.csList(paging);
		model.addAttribute("csList", csList);
		
	} 
	
	// -------------------- 행사 관리 --------------------    
    
	// 축제리스트 보이기
	
	@RequestMapping(value="/admin/festival", method=RequestMethod.GET)
	public void festivalList (
		     Model model,
		     @RequestParam(required=false, defaultValue="0") int curPage,
		     @RequestParam(required=false, defaultValue="9") int listCount,
		     @RequestParam(required=false, defaultValue="10") int pageCount
			
			) { 

		Paging paging = adminService.getFestivalPaging(curPage, listCount, pageCount);
		model.addAttribute("paging", paging);
		
		List<Festival> festivalList = adminService.festivalList(paging);
		model.addAttribute("festivalList", festivalList);
		
	} 

	// 축제 작성하기
	@RequestMapping(value="/admin/festivalWrite", method=RequestMethod.GET)
	public void adminFestival()
	{
		
	}

	// 축제 글쓰기 후 DB저장
	
	@RequestMapping(value="/admin/festivalWrite", method=RequestMethod.POST)
	public String adminFestivalWrite(
			MultipartFile file,
			Festival festival , 
			Image image,
			String start_date1 , 
			String end_date2 ) { 
		
		// 스트링타입을 sqlDate 형태로 형변환
		Date start_date = Date.valueOf(start_date1.replace("/", "-"));
		Date end_date = Date.valueOf(end_date2.replace("/", "-"));
		
		festival.setStart_date(start_date);
		festival.setEnd_date(end_date);
		
		adminService.writeFestival(festival);
		int festival_no = festival.getFestival_no();
		image.setFestival_no(festival_no);
		adminService.uploadThumbNail(context, file, image);
		
		return "redirect:/admin/festival";

	}
	
	// 축제 상세보이기
	
	@RequestMapping(value="/festival/view", method=RequestMethod.GET)
	public void festivalView (Model model, int festival_no) { 
		
		Festival festivalView = adminService.viewFestival(festival_no);
		model.addAttribute("festivalView", festivalView);
	}
	
	
	
	// -------------------- 결제 관리 --------------------  
	
	// 결제 리스트 보이기
	
	@RequestMapping(value="/admin/payList", method=RequestMethod.GET)
	public void PayList (
			Model model,
			@RequestParam(required=false, defaultValue="0") int curPage,
			@RequestParam(required=false, defaultValue="10")int listCount,
			@RequestParam(required=false, defaultValue="10")int pageCount,
		    @RequestParam(defaultValue="2") int pay_state_no) {
		

		Paging paging = adminService.getPayPaging(curPage, listCount, pageCount, pay_state_no);
		paging.setPay_state_no(pay_state_no);
		model.addAttribute("paging", paging);
		
		List<Pay> payList = adminService.payList(paging);
		model.addAttribute("payList", payList);

	}
	
	// 환불 승인하기
	
	@RequestMapping(value="/admin/approveRefund", method=RequestMethod.GET)
	public String approveRefund(int pay_no ) { 
		
		adminService.approveRefund(pay_no);
		return "redirect:/admin/payList?pay_state_no=2";
	}
	
	
	// -------------------- 신고 관리 --------------------  
	
	// 신고당한 멤버 리스트 보이기
	
	@RequestMapping(value="/admin/reportMember", method=RequestMethod.GET)
	public void reportMemberList (
			Model model,
			@RequestParam(required=false, defaultValue="0") int curPage,
			@RequestParam(required=false, defaultValue="10")int listCount,
			@RequestParam(required=false, defaultValue="10")int pageCount ){
		
        Paging paging = adminService.getReportMemberPaging(curPage, listCount, pageCount);
        model.addAttribute("paging", paging);
        
        List<Report> reportMemberList = adminService.memberReportList(paging);
        model.addAttribute("reportMemberList", reportMemberList);


	}
	
	
	// 멤버 비활성 시키기 
	
	@RequestMapping(value="/admin/memDisable", method=RequestMethod.GET)
	public String memberActiveResult(int mem_no ) { 
		
		adminService.MemberDisable(mem_no);
		return "redirect:/admin/reportMember";
	}
	
	// 신고당한 숙소 리스트 보이기
	
	@RequestMapping(value="/admin/reportLodge", method=RequestMethod.GET)
	public void reportLodgeList (
			Model model,
			@RequestParam(required=false, defaultValue="0") int curPage,
			@RequestParam(required=false, defaultValue="10")int listCount,
			@RequestParam(required=false, defaultValue="10")int pageCount ){
		
        Paging paging = adminService.getReportMemberPaging(curPage, listCount, pageCount);
        model.addAttribute("paging", paging);
        
        List<Report> reportLodgeList = adminService.lodgeReportList(paging);
        model.addAttribute("reportLodgeList", reportLodgeList);


	}
	
	
	// 숙소 비활성 시키기 
	
	@RequestMapping(value="/admin/lodgeDisable", method=RequestMethod.GET)
	public String lodgeDisable(int lodge_no ) { 
		
		adminService.LodgeDisable(lodge_no);
		return "redirect:/admin/reportLodge";
	}
	
	
	// 신고당한 댓글 리스트 보이기
	
	@RequestMapping(value="/admin/reportComment", method=RequestMethod.GET)
	public void reportCommentList (
			Model model,
			@RequestParam(required=false, defaultValue="0") int curPaging,
			@RequestParam(required=false, defaultValue="10")int listCount,
			@RequestParam(required=false, defaultValue="10")int pageCount ){
		
        Paging paging = adminService.getReportCcommentPaging(curPaging, listCount, pageCount);
        model.addAttribute("paging", paging);
        
        List<Report> reportCommentList = adminService.commentReportList(paging);
        model.addAttribute("reportCommentList", reportCommentList);


	}
	
	// 신고 댓글 삭제하기
	
	@RequestMapping(value="/admin/commentDelete", method=RequestMethod.GET)
	public String commentDelete(int comment_no ) { 
		
		adminService.deleteReportComment(comment_no);
		return "redirect:/admin/reportComment";
	}
	
	
}
