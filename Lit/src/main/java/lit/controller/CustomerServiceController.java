package lit.controller;


import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import lit.dto.Board;
import lit.dto.Comment;
import lit.service.face.CustomerService;

@Controller
@RequestMapping("/cs") //views에 있는 cs폴더
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
	public String enrollProc(Board board)
	{
		logger.info("출력1 : " + board.toString());
		customerService.writer(board);
		logger.info("출력2 : " + board.toString());
		return "redirect:/cs/cs";		
	}
	
	//문의내역 리스트	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void list(Model model, Board board)
	{
		logger.info("문의 리스트");	//board테이블에 mem_no 를 불러오는거
		List<Board> boardlist = customerService.boardlist(board);
		
		model.addAttribute("boardlist", boardlist);
	}
	
	//문의 답변 보기
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public void view(Model model, Board board)
	{
		logger.info("문의 답변 보기");
		
		board = customerService.boardview(board);
	
		model.addAttribute("boardlist",board);
	}
	
	//관리자 입장에서 문의 답변 하기
	@RequestMapping(value="/view", method=RequestMethod.POST)
	public String viewProc(Model model, Board board, Comment comment)
	{
		logger.info("관리자 문의 답변 처리하기");
		logger.info("전 : " + comment.toString());
				
		//관리자가 이용자의 문의 질문을 답변해줌
		//만약 answercount가 0이면 카운트 달아주고 기존에 board의 값을 0에서 1로 바꾸어준다
		if(customerService.answercount(board) == 0)
		{
			//답변 달아주기
			customerService.contentwriter(comment);
		
			//board 테이블에 answer 컬럼을 0에서 1로 바뀌기
			customerService.updateanswer(board);
		}
		//count가 1(답변 완료 중 상태에서 수정일 경우)
		else
		{
			//답변 수정 (의문, update 쿼리문을 짯는데 왜 추가가 되는 걸까?)
			customerService.updatecomment(comment);
		}
		
		logger.info("후 : " + comment.toString());
		return "redirect:/cs/cs";
	}
}