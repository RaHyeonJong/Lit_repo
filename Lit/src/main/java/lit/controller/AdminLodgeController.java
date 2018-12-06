package lit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lit.dao.face.AdminLodgeDao;
import lit.dto.Lodge;
import lit.dto.Room;
import lit.service.face.AdminLodgeService;
import lit.util.Paging;


@Controller
public class AdminLodgeController {

	@Autowired AdminLodgeService adminLodgeService;
	@Autowired AdminLodgeDao adminLodgeDao;
	
	@RequestMapping(value="/admin/lodge", method=RequestMethod.GET)
	public void adminLogeList (
		     Model model,
		     @RequestParam(required=false, defaultValue="0") int curPage,
		     @RequestParam(required=false, defaultValue="10") int listCount,
		     @RequestParam(required=false, defaultValue="10") int pageCount
			
			) { // 숙소리스트 보이기
		
		Paging paging = adminLodgeService.getPaging(curPage, listCount, pageCount);
		model.addAttribute("paging", paging);
		
		List<Lodge> adminLodgelist = adminLodgeService.getLudgeList(paging);
		model.addAttribute("adminLodgeList", adminLodgelist);
		
	} 
	
	@RequestMapping(value="/admin/lodgeView", method=RequestMethod.GET)
	public void lodgeView(Model model, int lodge_no ) { // 숙소 상세보이기
		
		Lodge lodge = adminLodgeService.viewLodge(lodge_no);
		model.addAttribute("lodge", lodge);			 
	}
	
	@RequestMapping(value="/admin/roomView", method=RequestMethod.GET)
	public void roomView(Model model, int room_no ) { // 방 상세보이기
		
		Room room = adminLodgeService.viewRoom(room_no);
		model.addAttribute("room", room);			 
	}
	
	@RequestMapping(value="/admin/lodgeActive_ok", method=RequestMethod.GET)
	public void adminLodgeActiveResult(int activation ) { // 숙소 활성화 시키기 ajax 결과
		
		adminLodgeDao.updateLodgeActivate(activation);
	}
	
	@RequestMapping(value="/admin/ludgeDelete", method=RequestMethod.GET)
	public void adminLodgeDelete(Lodge lodge) { // 숙소 정보 삭제하기
		
		adminLodgeService.delete(lodge);
	}
	
	@RequestMapping(value="/admin/roomDelete", method=RequestMethod.GET)
	public void adminRoomDelete(Room room) {  // 방 정보 삭제하기
		
		adminLodgeService.delete(room);
	}
	
	@RequestMapping(value="/admin/lodgeDeleteList", method=RequestMethod.POST)
	public void adminLodgeDeleteList(String names) { // 체크박스로 숙소 정보 리스트 모두 삭제하기
		
		adminLodgeService.deleteLudgeList(names);
	}
	
}
