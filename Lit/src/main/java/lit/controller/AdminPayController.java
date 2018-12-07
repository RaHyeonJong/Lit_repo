package lit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lit.dao.face.AdminPayDao;
import lit.dto.Pay;
import lit.service.face.AdminPayService;
import lit.util.Paging;


@Controller
public class AdminPayController {
	
	@Autowired AdminPayService adminPayService;
	@Autowired AdminPayDao adminPayDao;
	
	@RequestMapping(value="/admin/payList", method=RequestMethod.GET)
	public void payList (
		     Model model,
		     @RequestParam(required=false, defaultValue="0") int curPage,
		     @RequestParam(required=false, defaultValue="10") int listCount,
		     @RequestParam(required=false, defaultValue="10") int pageCount
			
			) { // 결제 리스트 보이기

		Paging payPaging = adminPayService.getPayPaging(curPage, listCount, pageCount);
		model.addAttribute("payPaging", payPaging);
		
		List<Pay> payList = adminPayService.payList(payPaging);
		model.addAttribute("payList", payList);
		
	} 
	
	
	@RequestMapping(value="/admin/refundList", method=RequestMethod.GET)
	public void refundList( // 환불 승인대기 내역 리스트 보이기
			 Model model,
		     @RequestParam(required=false, defaultValue="0") int curPage,
		     @RequestParam(required=false, defaultValue="10") int listCount,
		     @RequestParam(required=false, defaultValue="10") int pageCount
			
			) {
		
		Paging paging = adminPayService.getRefundPaging(curPage, listCount, pageCount);
		model.addAttribute("paging", paging);
		
		List<Pay> refundList = adminPayService.refundList(paging);
		model.addAttribute("refundList", refundList);
		
	}
	
	@RequestMapping(value="/admin/refundAccess_ok", method=RequestMethod.GET)
	public void refundAccess(int pay_state) { // 환불 승인 ajax
		
		adminPayDao.updateRefundAccess(pay_state);		
	}

	@RequestMapping(value="/admin/payView", method=RequestMethod.GET)
	public void payView( // 결제+환불 상세정보 보이기
			Model model,
			int pay_no) {
		
		Pay payView = adminPayService.viewPay(pay_no);
		model.addAttribute("payView", payView);
	}
	

	
	
}
