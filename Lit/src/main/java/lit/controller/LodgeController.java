package lit.controller;


import java.io.IOException;
import java.io.Writer;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lit.dto.Comment;
import lit.dto.Image;
import lit.dto.Lodge;
import lit.dto.Member;
import lit.dto.Message;
import lit.dto.Pay;
import lit.service.face.LodgeService;

@Controller
@RequestMapping("/lodge")

public class LodgeController {

	@Autowired LodgeService lodgeService;
	
	private static final Logger logger = 
			LoggerFactory.getLogger(LodgeController.class);
	
	
	
	@RequestMapping(value ="/view")
	public void LodgeView(Lodge lodge, Model model ) {
		//숙소 썸네일 클릭시 보여지는 상세 뷰
		// 숙소 번호를 파라미터로 받아와서 상세 뷰를 보여준다.
		//결제한 사람의 정보를 가져온다.
		//상세 뷰에 숙소에 결제한 사람만 후기 작성 버튼 보이게 한다.

		// 숙소와 회원 결제를 3개의 테이블을 조인해야한다. (결제한 사람의 정보를 가져올 수 있다)
		
		// 숙소와, 회원, 결제, 이미지 테이블 을 3개의 테이블을 조인해야한다. (결제한 사람의 정보를 가져올 수 있다)
		// 댓글 정보와 추천 정보도 같이 포함하여 뷰에 보여준다.
		// 댓글은 페이징 처리를 함
		
		
		//기본 리스트
		lodge = lodgeService.LodgeView(lodge);
		model.addAttribute("view",lodge);

		//이미지
		List<Image> lodgeimage = lodgeService.LodgeImage();
		model.addAttribute("lodgeimg", lodgeimage);
		
		//편의시설
		List<String> convenient = lodgeService.LodgeConvenient(lodge);
		model.addAttribute("item", convenient);
		
		// 댓글
		List<Comment> lodgereview = lodgeService.commentList();
		model.addAttribute("lodgeReview",lodgereview);
		
	}
	
	
	@RequestMapping(value ="/reservation", method =RequestMethod.GET)
	public void LodgeReservation(Pay pay) {
		// 예약 하기 클릭시 결제 정보를 보여준다.
		// 로그인이 안되있는 상태에선 리턴으로 로그인모달창을 띄운다.
		
//		lodgeService.LodgeReservationView(pay);
		
		
	}
	
	@RequestMapping(value ="/pay",method =RequestMethod.GET)
	public void LodgePay(Pay pay, Model model) {
		//결제하기 클릭시 결제정보를 보여주고 확인을 하면 결제가 완료되게 한다.
		if(lodgeService.LodgeReservationView(pay)) {
			
			model.addAttribute("reser", pay);
		}else {
			
		}
			
	}
	
	@RequestMapping(value ="/pay", method=RequestMethod.POST)
	public void LodgePay(Pay pay) {
		//결제하기 클릭시 결제수단,정보를 세션으로받아와서 DB에 저장
		lodgeService.LodgePay(pay);
		
	}
	
	@RequestMapping(value ="/insertReview",method =RequestMethod.POST)
	public String LodgeReview(Comment comment,Model model) {
		
			lodgeService.insertComment(comment);
			
			List<Comment> lodgereview = lodgeService.commentList();
			model.addAttribute("lodgeReview",lodgereview);
		
		return "/lodge/ajaxReviewList";
	}
	@RequestMapping(value ="/updateReview",method =RequestMethod.POST)
	public String LodgeupdateReview(Comment comment,Model model) {
		
		lodgeService.updateComment(comment);
		List<Comment> lodgereview = lodgeService.commentList();
		model.addAttribute("lodgeReview",lodgereview);

		
		return "/lodge/ajaxReviewList";
	}
	
	@RequestMapping(value ="/reviewDelete")
	public ModelAndView LodgeReviewDelete(Comment comment,ModelAndView mav) {
		// 요청 정보로 숙소 번호와 댓글번호를 가져온후 댓글 삭제

		mav.setViewName("jsonView");

		
		lodgeService.deleteComment(comment);
		
		return mav;
	}
	
	
	@RequestMapping(value ="/lodgeReview", method=RequestMethod.POST)
	public String InsertLodgeReply(Comment comment,Model model) {

		
		
		lodgeService.insertLodgeComment(comment);
		List<Comment> replyList = lodgeService.replyList();
		model.addAttribute("replyList",replyList);		
	
	
		return "/lodge/plyList";
	}
	
	
	
	
	@RequestMapping(value ="/like", method =RequestMethod.GET)
	public void LikeLodge(Lodge lodge) {
		//숙소 페이지에서 저장을 클릭하면 숙소 번호를 받아와서 
		// favarrite 테이블에 저장되게 한다.
		lodgeService.insertLike(lodge);
		
	}
	
	@RequestMapping(value ="/message", method = RequestMethod.GET)
	public void Message() {
		// 호스트에서 연락하기 클릭시 이동 되는 페이지
		// 
	}
	@RequestMapping(value ="/message", method = RequestMethod.POST)
	public void Message(Message message) {
		// 호스트에서 연락하기 클릭시 이동 되는 페이지
		// 해당숙소의 호스트에게 메시지를 보낼수 있게 한다.
		
		lodgeService.insertMessage(message);
	}
	
	@RequestMapping(value ="/dd", method =RequestMethod.GET)
	public void ReportLodge() {
		
	}
	@RequestMapping(value ="/report", method =RequestMethod.POST)
	public void ReportLodge(Lodge lodge) {
		// 숙소번호를 파라미터로 받아와서 report테이블에 저장.
		
		lodgeService.insertReport(lodge);
	}
}
