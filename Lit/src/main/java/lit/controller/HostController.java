package lit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import lit.service.face.HostService;

@Controller
public class HostController {
	
	@Autowired HostService hostService;

}
