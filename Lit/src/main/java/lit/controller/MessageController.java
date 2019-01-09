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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lit.dto.Member;
import lit.dto.Message;
import lit.service.face.MessageService;
import lit.util.Paging;

@Controller
@RequestMapping("/message")
public class MessageController {
	
	@Autowired MessageService messageService;
	//보여주기 [send측, receiver측]
	//쓰기, 삭제

	private static final Logger logger = LoggerFactory.getLogger(MessageController.class); 
	
	//보낸 쪽지함
	@RequestMapping(value="/send", method=RequestMethod.GET)
	public void send(Model model, HttpSession session,
			@RequestParam(defaultValue="1") int curPage)
	{
		logger.info("발신함");
		Member mem = (Member) session.getAttribute("member");
		
		int totalCount = messageService.sendcount(mem.getMem_no());
		
		Paging paging = new Paging(totalCount, curPage, 10, 10);
		
		paging.setMem_no(mem.getMem_no());
		List<Message> sendlist = messageService.sendlist(paging);

		model.addAttribute("paging",paging);
		model.addAttribute("sendlist", sendlist);
		
	}
	
	//받은 쪽지함
	@RequestMapping(value="/receive", method=RequestMethod.GET)
	public void receive(Model model, HttpSession session, Message message,
			@RequestParam(defaultValue="1") int curPage)
	{
		logger.info("수신함");
		Member mem = (Member) session.getAttribute("member");
		
		int totalCount = messageService.receivecount(mem.getMem_no());
		
		Paging paging = new Paging(totalCount, curPage, 10,10);
		
		paging.setMem_no(mem.getMem_no());
		
		List<Message> receivelist = messageService.receivelist(paging);
		
		model.addAttribute("paging",paging);
		model.addAttribute("receivelist", receivelist);
	}
	
	@RequestMapping(value="/receive", method=RequestMethod.POST)
	public @ResponseBody Message receiveProc(Message message, ModelAndView mav)
	{
	     mav.setViewName("jsonView"); 
	      
	      //읽지않음에서 읽음으로 변경
	     messageService.countupdate(message);
	     
	     
	      
	     return messageService.countList(message);

	   }
	
	
	// 메시지 쓰기 [보여주기]
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public void write()
	{
		logger.info("메시지 쓰기");
	}
	
	// 메시지 쓰기 [처리]
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String writeProc(Message message)
	{
		messageService.sendwrite(message);
		
		return "redirect:/mypage/main";
	}
	
	//메시지 삭제 처리
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public void delete()
	{
		logger.info("메시지 삭제");
	}
	
}