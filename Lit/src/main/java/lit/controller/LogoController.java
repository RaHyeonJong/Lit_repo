package lit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LogoController {

	// 로고 페이지
	@RequestMapping(value="/logo", method=RequestMethod.GET)
	public void logo() {
		
	}
	
	@RequestMapping(value="/logo/search", method=RequestMethod.GET)
	public void logoSearch(String destination) {
		
	}
}
