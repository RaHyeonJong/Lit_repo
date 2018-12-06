package lit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lit.dao.face.AdminPayDao;
import lit.dto.Pay;
import lit.service.face.AdminPayService;
import lit.util.Paging;

@Service
public class AdminPayServiceImpl implements AdminPayService {

	@Autowired AdminPayDao adminPayDao;
	
	@Override
	public List<Pay> payList(Paging payPaging) { // 결제 내역 보이기
		
		return adminPayDao.adminPaySelectAll(payPaging);
	}

	@Override
	public int getTotalPayCount() { // 결제 총 수 보이기
	
		return adminPayDao.paySelectCntAll();
	}

	@Override
	public Paging getPayPaging(int curPage, int listCount, int pageCount) {
		
		// 결제 페이징 처리
        int payTotalCount = this.getTotalPayCount();
		
		Paging payPaging = new Paging(payTotalCount,curPage,listCount,pageCount);

		return payPaging;
	}

	@Override
	public List<Pay> refundList(Paging refundPaging) { // 환불 승인대기 내역 리스트
		
		return adminPayDao.adminRefundSelectAll(refundPaging);
	}
	
	@Override
	public Paging getRefundPaging(int curPage, int listCount, int pageCount) {
		
		// 환불 페이징 처리
        int refundTotalCount = this.getTotalRefundCount();
		
		Paging refundPaging = new Paging(refundTotalCount,curPage,listCount,pageCount);

		return refundPaging;
	}

	@Override
	public int getTotalRefundCount() { // 환불 승인대기 총 수 

		return adminPayDao.refundSelectCntAll();
	}

	@Override
	public Pay viewPay(int pay_no) { // 결제+환불 상세 조회 페이지
		
		return adminPayDao.selectPayByPayno(pay_no);
	}



 

}
