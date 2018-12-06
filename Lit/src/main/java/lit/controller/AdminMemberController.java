package lit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lit.dao.face.AdminMemberDao;
import lit.dto.Member;
import lit.service.face.AdminMemberService;
import lit.util.Paging;

@Controller
public class AdminMemberController {
	
	@Autowired AdminMemberService adminMemberService;
	@Autowired AdminMemberDao adminMemberDao;
	
	@RequestMapping(value="/admin/member", method=RequestMethod.GET)
	public void memberList( // 멤버 리스트 보이기
		 Model model,
		 @RequestParam(required=false, defaultValue="0") int curPage,
		 @RequestParam(required=false, defaultValue="10") int listCount,
		 @RequestParam(required=false, defaultValue="10") int pageCount) {
		
		 Paging paging = adminMemberService.getPaging(curPage, listCount, pageCount);
		 model.addAttribute("paging",paging);
		 
	     List<Member> memberList = adminMemberService.memberList(paging);
	     model.addAttribute("memberList", memberList);
		
	}
	
	@RequestMapping(value="/admin/memberView", method=RequestMethod.GET)
	public void memberView( // 멤버 상세정보 보이기
			Model model,
			int mem_no) {
		
		Member member = adminMemberService.viewMember(mem_no);
		model.addAttribute("member", member);
	}
	
	
	@RequestMapping(value="/admin/memberView_ok", method=RequestMethod.GET)
	public void MemberDisableResult(int activation) { // 멤버 비활성화 시키기 ajax
		
		adminMemberDao.updateMemberDisable(activation);
	}
	
    
}
