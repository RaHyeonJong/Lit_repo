package lit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lit.dto.Board;
import lit.service.face.AdminFestivalService;
import lit.util.Paging;


@Controller
public class AdminFestivalController {
	
	@Autowired AdminFestivalService adminFestivalService;
	
	@RequestMapping(value="/admin/FestivalList", method=RequestMethod.GET)
	public void FestivalList (
		     Model model,
		     @RequestParam(required=false, defaultValue="0") int curPage,
		     @RequestParam(required=false, defaultValue="10") int listCount,
		     @RequestParam(required=false, defaultValue="10") int pageCount
			
			) { // 축제리스트 보이기

		Paging paging = adminFestivalService.getPaging(curPage, listCount, pageCount);
		model.addAttribute("paging", paging);
		
		List<Board> festivalList = adminFestivalService.festivalList(paging);
		model.addAttribute("festivalList", festivalList);
		
	} 

	@RequestMapping(value="/admin/festivalView", method=RequestMethod.GET)
	public void festivalView(Model model, int board_no ) { // 축제 상세보이기
		
		Board festival = adminFestivalService.viewFestival(board_no);
		model.addAttribute("festival", festival);			 
	}
	
	@RequestMapping(value="/admin/festivalDelete", method=RequestMethod.GET)
	public void adminFestivalDelete(Board festival) { // 축제 정보 삭제하기
		
		adminFestivalService.delete(festival);
	}
	
	@RequestMapping(value="/admin/festivalDeleteList", method=RequestMethod.POST)
	public void adminFestivalDeleteList(String names) { // 체크박스로 축제 정보 리스트 모두 삭제하기
		
		adminFestivalService.deleteFestivalList(names);
	}
	
	@RequestMapping(value="/admin/festivalWrite", method=RequestMethod.GET)
	public void adminFestivalWrite(Board festival) { // 축제 글쓰기
		
		adminFestivalService.writeFestival(festival);
	}
	
	@RequestMapping(value="/admin/eventUpdate", method=RequestMethod.GET)
	public void adminEventUpdate(Board event) { // 축제 글 수정
		
		adminFestivalService.updateFestival(event);
	}
	
}
