package lit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class JoinController {
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public void join() {}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinProcess() {
		
		
		return null;
	}
	
	@RequestMapping(value="/join/checkId")
	public void checkId() {
		
	}
}
