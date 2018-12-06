package lit.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lit.dto.Message;
import lit.service.face.MessageService;

@Controller
@RequestMapping("/message")
public class MessageController {
	
	@Autowired MessageService messageService;

	//이게 맞는지 모르겠음..
	//보여주기 [send측, receiver측]
	//쓰기, 삭제

	private static final Logger logger = LoggerFactory.getLogger(MessageController.class); 
	
	//Send측 LIST
	@RequestMapping(value="/send", method=RequestMethod.GET)
	public void sendList()
	{
		
	}

	//List 항목에서 상세보기
	@RequestMapping(value="/sendview", method=RequestMethod.GET)
	public void sendView()
	{
		
	}
	
	
	//Receiver측 LIST
	@RequestMapping(value="/receive", method=RequestMethod.GET)
	public void receiveList()
	{
		
	}
	
	//List 항목에서 상세보기
	@RequestMapping(value="/receiveView", method=RequestMethod.GET)
	public void receiveView()
	{
		
	}
	
	// 메시지 쓰기
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public void write()
	{
		logger.info("메시지 쓰기");
	}
	
	// 메시지 쓰기 처리
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String writeProc(Message message, HttpSession session)
	{
		
		
		return "/message";
	}
	
	//메시지 삭제
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public void delete()
	{
		logger.info("메시지 삭제");
	}
	
	
}
