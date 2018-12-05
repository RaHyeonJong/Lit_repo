package lit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lit.service.face.CustomerService;

@Controller
@RequestMapping("/cs")
public class CustomerServiceController {

	@Autowired CustomerService customerService;
	
	@RequestMapping(value="/cs", method=RequestMethod.GET)
	public void cs()
	{
		
	}
	
	
}
