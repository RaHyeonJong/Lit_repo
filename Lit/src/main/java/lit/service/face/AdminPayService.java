package lit.service.face;

import java.util.List;

import lit.dto.Pay;
import lit.util.Paging;

public interface AdminPayService {

	// 결제 내역 리스트 보이기
	public List<Pay> payList(Paging paging);
	
	// 전체 결제 수 조회
	public int getTotalPayCount();
	
	// 결제 페이징 정보 만들기
	public Paging getPayPaging(int curPage, int listCount, int pageCount);
	
	// 환불 승인 대기 내역 리스트 보이기
	public List<Pay> refundList(Paging refundPaging);
	
	// 환불 페이징 정보 만들기
	public Paging getRefundPaging(int curPage, int listCount, int pageCount);
	
	// 환불 승인 대기 수 조회 
	public int getTotalRefundCount();
	
	// 결제+환불 상세 정보 조회
	public Pay viewPay(int pay_no);
	

	
}
