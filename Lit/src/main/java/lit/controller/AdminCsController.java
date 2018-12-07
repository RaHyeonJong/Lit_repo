package lit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lit.dto.Board;
import lit.service.face.AdminCsService;
import lit.util.Paging;



@Controller
public class AdminCsController {
	
	@Autowired AdminCsService adminCsService;
	
	@RequestMapping(value="/admin/csList", method=RequestMethod.GET)
	public void csList (
		     Model model,
		     @RequestParam(required=false, defaultValue="0") int curPage,
		     @RequestParam(required=false, defaultValue="10") int listCount,
		     @RequestParam(required=false, defaultValue="10") int pageCount
			
			) { // 고객문의 리스트 보이기

		Paging paging = adminCsService.getPaging(curPage, listCount, pageCount);
		model.addAttribute("paging", paging);
		
		List<Board> csList = adminCsService.csList(paging);
		model.addAttribute("csList", csList);
		
	} 
	
	@RequestMapping(value="/admin/csView", method=RequestMethod.GET)
	public void csView(Model model, int board_no ) { // 고객문의 상세보이기
		
		Board csView = adminCsService.csView(board_no);
		model.addAttribute("csView", csView);
		
		// 댓글 존재여부 ( 갯수 ) dao에서 불러와서 commet에 담아서 jsp에 뿌려주기
	}

	@RequestMapping(value="/admin/csComment", method=RequestMethod.POST)
	public void csCommentInsert( ) { // 댓글 쓰기
				 
	}
	
	@RequestMapping(value="/admin/csCommentDelete", method=RequestMethod.GET)
	public void csCommentDelete( ) { // 댓글 삭제
				 
	}
	

	
}
