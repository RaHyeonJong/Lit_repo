package lit.dao.face;

import java.util.List;

import lit.dto.Pay;
import lit.util.Paging;

public interface AdminPayDao {

	// 결제 내역 리스트 보이기
	public List<Pay> adminPaySelectAll(Paging payPaging);
		
	// 전체 결제 수 조회 (페이징 처리)
	public int paySelectCntAll();
	
	// 환불 승인대기내역 리스트 보이기
	public List<Pay> adminRefundSelectAll(Paging refundPaging);
	
	// 전체 환불 승인 대기 수 조회 (페이징 처리)
	public int refundSelectCntAll();
	
	// 환불 승인 
	public void updateRefundAccess(int pay_state);
	
	// 결제+환불 상세 정보 반환 
	public Pay selectPayByPayno(int pay_state);
	

	
}
