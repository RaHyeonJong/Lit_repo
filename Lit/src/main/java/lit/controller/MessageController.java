package lit.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lit.dto.Member;
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
	
	//보낸 쪽지함
	@RequestMapping(value="/send", method=RequestMethod.GET)
	public void send(Message message, Model model, HttpSession session)
	{
		logger.info("발신함");
		
		Member mem = (Member) session.getAttribute("member");
		
		message.setSender_no(mem.getMem_no());
		List<Message> sendlist = messageService.sendlist(message);
		
		model.addAttribute("sendlist", sendlist);

	}
	
	//받은 쪽지함
	@RequestMapping(value="/receive", method=RequestMethod.GET)
	public void receive(Model model, Message message, HttpSession session)
	{
		logger.info("수신함");
		Member mem = (Member) session.getAttribute("member");
	
		// 리시버 넘버에 mem_no 넣는거잖아요
		System.out.println("테스트 : " + mem.getMem_no());
		message.setReceiver_no(mem.getMem_no());
		List<Message> receivelist = messageService.receivelist(message);
		
		model.addAttribute("receivelist", receivelist);
	}
	
	// 메시지 쓰기 [보여주기]
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public void write()
	{
		logger.info("메시지 쓰기");
	}
	
	// 메시지 쓰기 [처리]
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String writeProc(Message message, HttpSession session)
	{
		
		
		return "/message/send";
	}
	
	//메시지 삭제 처리
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public void delete()
	{
		logger.info("메시지 삭제");
	}

}