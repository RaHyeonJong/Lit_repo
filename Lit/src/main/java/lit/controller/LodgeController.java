package lit.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.stream.Collectors;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import javax.servlet.http.HttpServletResponse;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import edu.emory.mathcs.backport.java.util.Arrays;
import lit.dto.Comment;
import lit.dto.Day_off;
import lit.dto.Favorite;
import lit.dto.Image;
import lit.dto.Lodge;
import lit.dto.Member;
import lit.dto.Message;
import lit.dto.Pay;
import lit.dto.Report;
import lit.service.face.LodgeService;
import sun.java2d.pipe.SpanShapeRenderer.Simple;

@Controller
@RequestMapping("/lodge")

public class LodgeController {

	@Autowired LodgeService lodgeService;
	
	private static final Logger logger = 
			LoggerFactory.getLogger(LodgeController.class);
	
	
	
	
	@RequestMapping(value ="/view", method = RequestMethod.GET)
	public void LodgeView(Lodge lodge,HttpSession session, Model model, Comment comment, Favorite favorite,Day_off day_off ) {
		
		logger.info(session.toString());
		
		
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
		
		//결제한 회원
		if((Member)session.getAttribute("member") != null) {
		
		Pay pay = new Pay();
		pay.setMem_no( ((Member)session.getAttribute("member") ).getMem_no()   );
		pay.setLodge_no(lodge.getLodge_no());
		boolean LodgePay = lodgeService.SelectLodgePay(pay);
		model.addAttribute("payd", LodgePay);
		}
		
		//휴무일
		List<Day_off> dd = lodgeService.selectDay(lodge);
		
		SimpleDateFormat d = new SimpleDateFormat("yyyy.M.d");
		List<String> date = new ArrayList<>();
		
		
		for(Day_off off : dd ) {
//			date.add(d.format(off.getDay_off_date()));
			
			String[] list = new String[] {d.format(off.getDay_off_date())};
			
			List<String> datelist = Arrays.asList(list);
			
			
			String d2 = datelist.stream().map(date3 -> "'"+date3+"'").collect(Collectors.joining(","));
			
			date.add(d2);
			
			 System.out.println(date);
			
			model.addAttribute("off",date);
		}
		
		
	
		
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
				
				Integer service = (int)(add*0.1); //서비스 수수료
				
				int total = add + (int)service; //총액
				
				int stay_heads = person;

//				Pay p = new Pay();
//				p.setLodge_no(lodge.getLodge_no()); //숙소번호
//				p.setService_fee(service); //
//				p.setPay_sum(total);
//				p.setStay_heads(person);
//				p.setStay_start(startDate);
//				p.setStay_end(endDate);
	
//				model.addAttribute("payment",p);
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
			Date st = date.parse(startDate);
			Date e = date.parse(endDate);
			
			
			SimpleDateFormat date2 = new SimpleDateFormat("yyyy-MM-dd");
			
			String st2 = date2.format(st);
			String e2 = date2.format(e);
			System.out.println(st2);
			System.out.println(e2);
			
			java.sql.Date start_date = java.sql.Date.valueOf(st2); 
			java.sql.Date end_date = java.sql.Date.valueOf(e2);
			
			model.addAttribute("startDate", start_date);
			model.addAttribute("endDate", end_date);
			
			Calendar c1 = Calendar.getInstance();
			Calendar c2 = Calendar.getInstance();
			
			c1.setTime(start_date);
			c2.setTime(end_date);
			
			long d1, d2;
			
			//밀리초로 변환
			d1 = c1.getTime().getTime();
			d2 = c2.getTime().getTime();
				
			
			
			
			//계산
			int days = (int)(d2-d1)/(1000*60*60*24);
			model.addAttribute("stay_term",days);
//				System.out.println(days);
			
			lodge = lodgeService.LodgeReservationView(lodge);//예약시 보여줄 view
			
			int stay_heads = person;
			model.addAttribute("reservation", lodge);
			
			//숙소 이미지
			List<Image> lodgeimage = lodgeService.LodgeImage();
			model.addAttribute("lodgeimg", lodgeimage);
			
			//댓글 수
			
			int lodge_count = lodgeService.lodgeCountcomment(lodge);
			model.addAttribute("comment", lodge_count);
			
			//게스트 수
			model.addAttribute("person", stay_heads);
			
			//숙박 비용
			model.addAttribute("lodge_pay",lodge.getStay_cost());
			
			
			//서비스 수수료
			Integer fee =  service_fee.intValue();
			
			model.addAttribute("service_fee", fee);
			System.out.println(fee);
			
			
			
			int cleaning_cost;
			if(pay_sum <10000) {
				 cleaning_cost = 5000;
				 pay_sum += cleaning_cost;
			model.addAttribute("clean",cleaning_cost);
			//총 합계
			model.addAttribute("pay_sum", pay_sum);
			}else {
				 cleaning_cost = 10000;
				 pay_sum += cleaning_cost;
				 model.addAttribute("clean",cleaning_cost);
				//총 합계
				model.addAttribute("pay_sum", pay_sum);
			
			}
			
			//편의 시설
			List<String> convenient = lodgeService.LodgeConvenient(lodge);
			model.addAttribute("item", convenient);
			
			
			
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

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
		
		if(lodge_like) {
			lodgeService.insertLike(favorite);
			like.addObject("like",lodge_like);
		}else {
			lodgeService.deleteLike(favorite);
			like.addObject("unlike",lodge_like);
		}
		
		
		
		return like;
	}
	

	@RequestMapping(value ="/report", method =RequestMethod.GET)
	public void ReportLodge(Report report, HttpServletResponse resp) {
		
		PrintWriter writer = null;
		
		
		try {
			writer = resp.getWriter();
			
			boolean alreadyReport = lodgeService.checkLodgeReport(report);
			
			if(!alreadyReport) {
				lodgeService.reportLodge(report);
				writer.write("1");
			} else {
				writer.write("-1");
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if(writer != null) writer.close();
		}		
	
	
	
	}
	@RequestMapping(value ="/Commentreport", method =RequestMethod.GET)
	public void ReportComment(Report report, HttpServletResponse resp) {
		
		PrintWriter writer = null;
		
		
			try {
				writer = resp.getWriter();
				boolean commentReport = lodgeService.commentReport(report);
				
				if(!commentReport) {
					lodgeService.insertReport(report);
					writer.write("1");
				}else {
					lodgeService.deleteCommentReport(report);
					writer.write("-1");
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				if(writer != null) writer.close();
			}		
	
	}
	
	@RequestMapping(value ="/sidebar", method =RequestMethod.GET)
	public void sidebar() {}
	
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
	
	
	
	@RequestMapping(value ="/pay", method=RequestMethod.POST)
	public ModelAndView LodgePay(Pay pay,String start, String end,  ModelAndView mav) {
		mav.setViewName("jsonView");
		

		SimpleDateFormat d3 = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			Date start4 = d3.parse(start);
			Date end4 = d3.parse(end);

			pay.setStay_start(start4);
			pay.setStay_end(end4);
			System.out.println(pay.toString());
			lodgeService.LodgePay(pay);
		
		
		} catch (ParseException e) {
			e.printStackTrace();
		}
				
		
		return mav ;

	}
	
	
}
