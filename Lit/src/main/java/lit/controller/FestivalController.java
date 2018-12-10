package lit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lit.dto.Festival;
import lit.service.face.FestivalService;



@Controller
public class FestivalController {
	@Autowired FestivalService festivalService;
	
	@RequestMapping(value="/festival/View", method=RequestMethod.GET)
	public void festivalView(Model model, int festival_no ) { // 축제 상세보이기
		
		Festival festival = festivalService.viewFestival(festival_no);
		model.addAttribute("festival", festival);			 
	}
	

}
