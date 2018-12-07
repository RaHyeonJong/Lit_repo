package lit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lit.dto.Board;
import lit.dto.Festival;
import lit.dto.Lodge;
import lit.dto.Member;
import lit.dto.Pay;
import lit.service.face.AdminService;
import lit.util.Paging;

@Controller
public class AdminController {

	@Autowired AdminService adminService;
	
	
	
	// -------------------- 회원관리 --------------------
	
	
	
	@RequestMapping(value="/admin/member", method=RequestMethod.GET)
	public void memberList( // 멤버 리스트 보이기
		 Model model,
		 @RequestParam(required=false, defaultValue="0") int curPage,
		 @RequestParam(required=false, defaultValue="10") int listCount,
		 @RequestParam(required=false, defaultValue="10") int pageCount) {
		
		 Paging paging = adminService.getMemberPaging(curPage, listCount, pageCount);
		 model.addAttribute("paging",paging);
		 
	     List<Member> memberList = adminService.memberList(paging);
	     model.addAttribute("memberList", memberList);
		
	}
	
	@RequestMapping(value="/admin/memberView", method=RequestMethod.GET)
	public void memberView( // 멤버 상세정보 보이기
			Model model,
			int mem_no) {
		
		Member member = adminService.viewMember(mem_no);
		model.addAttribute("member", member);
	}
	
	
	@RequestMapping(value="/admin/memberView_ok", method=RequestMethod.GET)
	public void MemberDisableResult(int activation) { // 멤버 비활성화 시키기 ajax
		
		adminService.memberDisable(activation);
	}
	
	
	
	
	// -------------------- 숙소관리 -------------------- 
	
	

	@RequestMapping(value="/admin/lodge", method=RequestMethod.GET)
	public void adminLogeList (
		     Model model,
		     @RequestParam(required=false, defaultValue="0") int curPage,
		     @RequestParam(required=false, defaultValue="10") int listCount,
		     @RequestParam(required=false, defaultValue="10") int pageCount
			
			) { // 숙소리스트 보이기
		
		Paging paging = adminService.getLodgePaging(curPage, listCount, pageCount);
		model.addAttribute("paging", paging);
		
		List<Lodge> adminLodgelist = adminService.getLudgeList(paging);
		model.addAttribute("adminLodgeList", adminLodgelist);
		
	} 
	
	
	@RequestMapping(value="/admin/lodgeActive_ok", method=RequestMethod.GET)
	public void adminLodgeActiveResult(int activation ) { // 숙소 비활성화 시키기 ajax 결과
		
		adminService.lodgeDisable(activation);
	}
	
	
	
	// -------------------- 결제 관리 --------------------

	
	
	@RequestMapping(value="/admin/payList", method=RequestMethod.GET)
	public void payList (
		     Model model,
		     @RequestParam(required=false, defaultValue="0") int curPage,
		     @RequestParam(required=false, defaultValue="10") int listCount,
		     @RequestParam(required=false, defaultValue="10") int pageCount
			
			) { // 결제 리스트 보이기

		Paging payPaging = adminService.getPayPaging(curPage, listCount, pageCount);
		model.addAttribute("payPaging", payPaging);
		
		List<Pay> payList = adminService.payList(payPaging);
		model.addAttribute("payList", payList);
		
	} 
	
	
	@RequestMapping(value="/admin/refundList", method=RequestMethod.GET)
	public void refundList( // 환불 승인대기 내역 리스트 보이기
			 Model model,
		     @RequestParam(required=false, defaultValue="0") int curPage,
		     @RequestParam(required=false, defaultValue="10") int listCount,
		     @RequestParam(required=false, defaultValue="10") int pageCount
			
			) {
		
		Paging paging = adminService.getRefundPaging(curPage, listCount, pageCount);
		model.addAttribute("paging", paging);
		
		List<Pay> refundList = adminService.refundList(paging);
		model.addAttribute("refundList", refundList);
		
	}
	
	@RequestMapping(value="/admin/refundAccess_ok", method=RequestMethod.GET)
	public void refundAccess(int pay_state) { // 환불 승인 ajax
		
		adminService.refundAccess(pay_state);
	}

	@RequestMapping(value="/admin/payView", method=RequestMethod.GET)
	public void payView( // 결제+환불 상세정보 보이기
			Model model,
			int pay_state) {
		
		Pay payView = adminService.viewPay(pay_state);
		model.addAttribute("payView", payView);
	}
	
	
	
	// -------------------- 고객문의 관리 -------------------- 
	
	
	
	@RequestMapping(value="/admin/csList", method=RequestMethod.GET)
	public void csList (
		     Model model,
		     @RequestParam(required=false, defaultValue="0") int curPage,
		     @RequestParam(required=false, defaultValue="10") int listCount,
		     @RequestParam(required=false, defaultValue="10") int pageCount
			
			) { // 고객문의 리스트 보이기

		Paging paging = adminService.getCsPaging(curPage, listCount, pageCount);
		model.addAttribute("paging", paging);
		
		List<Board> csList = adminService.csList(paging);
		model.addAttribute("csList", csList);
		
	} 
	
	@RequestMapping(value="/admin/csView", method=RequestMethod.GET)
	public void csView(Model model, int board_no ) { // 고객문의 상세보이기
		
		Board csView = adminService.csView(board_no);
		model.addAttribute("csView", csView);
		
		// 댓글 존재여부 ( 갯수 ) dao에서 불러와서 commet에 담아서 jsp에 뿌려주기
	}

	@RequestMapping(value="/admin/csComment", method=RequestMethod.POST)
	public void csCommentInsert( ) { // 댓글 쓰기
				 
	}
	
	@RequestMapping(value="/admin/csCommentDelete", method=RequestMethod.GET)
	public void csCommentDelete( ) { // 댓글 삭제
				 
	}
	
	
	
	// -------------------- 행사&축제 관리 -------------------- 
	
	
	
	@RequestMapping(value="/admin/festivalList", method=RequestMethod.GET)
	public void festivalList (
		     Model model,
		     @RequestParam(required=false, defaultValue="0") int curPage,
		     @RequestParam(required=false, defaultValue="10") int listCount,
		     @RequestParam(required=false, defaultValue="10") int pageCount
			
			) { // 축제리스트 보이기

		Paging paging = adminService.getCsPaging(curPage, listCount, pageCount);
		model.addAttribute("paging", paging);
		
		List<Board> festivalList = adminService.csList(paging);
		model.addAttribute("festivalList", festivalList);
		
	} 

	@RequestMapping(value="/admin/festivalDelete", method=RequestMethod.GET)
	public void adminFestivalDelete(Festival festival) { // 축제 정보 삭제하기
		
		adminService.delete(festival);
	}
	
	@RequestMapping(value="/admin/festivalDeleteList", method=RequestMethod.POST)
	public void adminFestivalDeleteList(String names) { // 체크박스로 축제 정보 리스트 모두 삭제하기
		
		adminService.deleteFestivalList(names);
	}
	
	@RequestMapping(value="/admin/festivalWrite", method=RequestMethod.GET)
	public void adminFestivalWrite(Festival festival) { // 축제 글쓰기
		
		adminService.writeFestival(festival);
	}
	
	@RequestMapping(value="/admin/festivalUpdate", method=RequestMethod.GET)
	public void adminFestivalUpdate(Festival festival) { // 축제 글 수정
		
		adminService.updateFestival(festival);
	}

	
}
