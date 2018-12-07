package lit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lit.dto.Board;
import lit.service.face.FestivalService;



@Controller
public class FestivalController {
	@Autowired FestivalService festivalService;
	
	@RequestMapping(value="/festival/View", method=RequestMethod.GET)
	public void eventView(Model model, int board_no ) { // 축제 상세보이기
		
		Board festival = festivalService.viewFestival(board_no);
		model.addAttribute("festival", festival);			 
	}
	

}
