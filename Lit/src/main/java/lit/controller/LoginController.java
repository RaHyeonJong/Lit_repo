package lit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lit.service.face.LoginService;

@Controller
public class LoginController {
	
	@Autowired LoginService loginService;
	
	@RequestMapping(value="/login")
	public void login() {
		
	}
}
