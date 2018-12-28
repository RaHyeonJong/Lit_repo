package lit.controller;


import java.io.IOException;
import java.io.Writer;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
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
import org.springframework.web.servlet.ModelAndView;

import lit.dto.Comment;
import lit.dto.Favorite;
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
	public void LodgeView(Lodge lodge, Model model, Comment comment, Favorite favorite ) {
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
				
		List<Comment> replyList = lodgeService.replyList(comment);
		model.addAttribute("replyList",replyList);		
	
		//좋아요
		boolean like =  lodgeService.selectLike(favorite);
		model.addAttribute("lodge_like", like);
		
	}
	
	
	@RequestMapping(value ="/search", method =RequestMethod.POST)
	public String re(Lodge lodge,Model model,
			@RequestParam(defaultValue="00/00/0000") String start,
          @RequestParam(defaultValue="00/00/0000") String end, int person ) {
		
		Map resultMap = new HashMap();
	
		final String DATE_PATTERN = "MM/dd/yyyy"; 

		SimpleDateFormat simple = new SimpleDateFormat(DATE_PATTERN);

		try {
			Date startDate = simple.parse(start);
			Date endDate = simple.parse(end);
	
			ArrayList<String> dates = new ArrayList<String>();
			
			Date currentDate = startDate; //시작 날짜
			while (currentDate.compareTo(endDate) <= 0) {
				dates.add(simple.format(currentDate));
				Calendar c = Calendar.getInstance();
				c.setTime(currentDate);
				c.add(Calendar.DAY_OF_MONTH, 1);
				currentDate = c.getTime();
			}
				//요금 계산 
				
				int add = lodge.getStay_cost()*dates.size(); //숙박 일당 계산
				
				double service = add*0.1; //서비스 수수료
				
				int total = add + (int)service; //총액
				
				int stay_heads = person;
				System.out.println(stay_heads);
				model.addAttribute("lodge_no",lodge.getLodge_no());
				model.addAttribute("add", add);
				model.addAttribute("ser", service);
				model.addAttribute("total",total);
				model.addAttribute("person", stay_heads);
				model.addAttribute("startDate",startDate);
				model.addAttribute("endDate",endDate);
				
				
				
		} catch (ParseException e) {

			e.printStackTrace();
		}
		
		
		return "/lodge/total";
	}
	
	

	@RequestMapping(value ="/reservation", method =RequestMethod.GET)
	public void LodgeReservation(Lodge lodge) {}
	
	@RequestMapping(value ="/reservation", method =RequestMethod.POST)
	public void LodgeReservation2(Double service_fee,int pay_sum,int person,Lodge lodge, Model model,
			String startDate,String endDate) {
		
//		System.out.println(lodge.getLodge_no());
//		System.out.println(service_fee);
//		System.out.println(lodge.getStay_cost());
//		System.out.println(pay_sum);
		
		SimpleDateFormat date = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy",Locale.ENGLISH);
		try {
			Date start = date.parse(startDate);
			Date end = date.parse(endDate);
			
			model.addAttribute("startDate", start);
			model.addAttribute("endDate", end);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		lodge = lodgeService.LodgeReservationView(lodge);//예약시 보여줄 view
		
		int stay_heads = person;
		model.addAttribute("reservation", lodge);
		model.addAttribute("person", stay_heads);
		

	}
	
	
	@RequestMapping(value ="/pay",method =RequestMethod.GET)
	public void LodgePay(Pay pay, Model model) {
		//결제하기 클릭시 결제정보를 보여주고 확인을 하면 결제가 완료되게 한다.
			
			model.addAttribute("reser", pay);
			
			
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
		List<Comment> replyList = lodgeService.replyList(comment);
		model.addAttribute("replyList",replyList);		
	
		
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

		//댓글
		List<Comment> lodgereview = lodgeService.commentList();
		model.addAttribute("lodgeReview",lodgereview);
		
		//대댓글
		List<Comment> replyList = lodgeService.replyList(comment);
		model.addAttribute("replyList",replyList);		
	
	
		return "/lodge/ajaxReviewList";
	}
	
	
	
	
	@RequestMapping(value ="/like", method =RequestMethod.POST)
	public ModelAndView LikeLodge(Favorite favorite, ModelAndView like) {
		
		like.setViewName("jsonView");
		
		boolean lodge_like = lodgeService.selectLike(favorite);
		
		if(lodge_like == true) {
			lodgeService.insertLike(favorite);
			like.addObject("like",lodge_like);
		}else {
			lodgeService.deleteLike(favorite);
			like.addObject("unlike",lodge_like);
		}
		
		
		
		return like;
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
	

	@RequestMapping(value ="/report", method =RequestMethod.POST)
	public void ReportLodge(Lodge lodge) {
		// 숙소번호를 파라미터로 받아와서 report테이블에 저장.
		
		lodgeService.insertReport(lodge);
	}
	
	@RequestMapping(value ="/sidebar", method =RequestMethod.GET)
	public void sidebar() {}
	
	
	
	
	
}
