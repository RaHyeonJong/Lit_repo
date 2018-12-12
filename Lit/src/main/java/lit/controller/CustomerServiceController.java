package lit.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import lit.service.face.CustomerService;

@Controller
//views에 있는 cs폴더
@RequestMapping("/cs")
public class CustomerServiceController {

	@Autowired CustomerService customerService;
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerServiceController.class); 
	
	//자주찾는 질문 보여주기
	@RequestMapping(value="/cs", method=RequestMethod.GET)
	public void cs()
	{
		logger.info("고객센터 시작 알림");

	}
	
	//1:1문의하기 선택지
	@RequestMapping(value="/select", method=RequestMethod.GET)
	public void select()
	{
		logger.info("1대1 선택지!!");
	}
	

	//문의내용 작성하기
	@RequestMapping(value="/enroll", method=RequestMethod.GET)
	public void enroll()
	{
		logger.info("문의 등록");
	}
	
	//작성 후, DB저장
	@RequestMapping(value="/enroll", method=RequestMethod.POST)
	public void enrollProc()
	{
		logger.info("문의 등록 처리");
	}
	
	//문의내역 리스트
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void list()
	{
		logger.info("문의 리스트");
	}
	
	//문의 답변 보기
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public void view()
	{
		logger.info("문의 답변 보기");
	}
	
}
