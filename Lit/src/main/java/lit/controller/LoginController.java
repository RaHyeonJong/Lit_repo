package lit.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lit.service.face.LoginService;

@Controller
public class LoginController {

	@Autowired LoginService loginService;
	
	@GetMapping(value="/login")
	public void login() { }
	
	@PostMapping(value="/login")
	public String loginProcess() {
		
		return null;
	}
}
