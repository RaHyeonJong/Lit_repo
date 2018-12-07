package lit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lit.dao.face.AdminDao;
import lit.dto.Board;
import lit.dto.Comment;
import lit.dto.Festival;
import lit.dto.Lodge;
import lit.dto.Member;
import lit.dto.Pay;
import lit.service.face.AdminService;
import lit.util.Paging;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired AdminDao adminDao;
	
	// -------------------- 회원관리 --------------------
	
	@Override
	public List<Member> memberList(Paging paging) { // 멤버 리스트 
		
		return adminDao.memberSelectAll(paging);
	}
	
	@Override
	public int getTotalMemberCount() { // 멤버 전체 수 조회
		
		return adminDao.MemberSelectCntAll();
	}
	
	@Override
	public Paging getMemberPaging(int curPage, int listCount, int pageCount) {
		
		// 페이징 처리
        int totalCount = this.getTotalMemberCount();
		
		Paging paging = new Paging(totalCount,curPage,listCount,pageCount);
		
		return paging;
	}


	@Override
	public Member viewMember(int mem_no) { // 멤버 상세 보이기
		
		return adminDao.selectMemberByMemberno(mem_no);
	}

	@Override
	public void memberDisable(int activation) { // 멤버 비활성화 시키기
		
		adminDao.updateMemberDisable(activation);	
	}

	
	// -------------------- 숙소관리 --------------------
	
	@Override
	public List<Lodge> getLudgeList(Paging paging) { // 숙소 리스트 

		return adminDao.lodgeSelectAll(paging);
	}

	@Override
	public int getTotalLudgeCount() { // 총 숙소 수

		return adminDao.lodgeSelectCntAll();
	}
	
	@Override
	public Paging getLodgePaging(int curPage, int listCount, int pageCount) {
		
		// 페이징 처리
        int totalCount = this.getTotalLudgeCount();
		
		Paging paging = new Paging(totalCount,curPage,listCount,pageCount);
		
		return paging;
	}

	@Override
	public void lodgeDisable(int activation) { // 숙소 비활성화 시키기
		
		adminDao.updateLodgeActivate(activation);
	}
	
	// -------------------- 결제관리 --------------------
	
	@Override
	public List<Pay> payList(Paging payPaging) { // 결제 내역 보이기
		
		return adminDao.adminPaySelectAll(payPaging);
	}

	@Override
	public int getTotalPayCount() { // 결제 총 수 보이기
	
		return adminDao.paySelectCntAll();
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
		
		return adminDao.adminRefundSelectAll(refundPaging);
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

		return adminDao.refundSelectCntAll();
	}

	@Override
	public Pay viewPay(int pay_state) { // 결제+환불 상세 조회 페이지
		
		return adminDao.selectPayByPayno(pay_state);
	}

	@Override
	public void refundAccess(int pay_state) { // 환불 승인하기
		
		adminDao.updateRefundAccess(pay_state);
	}
	
	// -------------------- 결제관리 --------------------
	
	@Override
	public List<Board> csList(Paging paging) {
		
		return adminDao.csSelectAll(paging);
	}

	@Override
	public int getTotalCsCount() {
		
		return adminDao.csSelectCntAll();
	}

	@Override
	public Paging getCsPaging(int curPage, int listCount, int pageCount) {
		
		// 페이징 처리
        int totalCount = this.getTotalCsCount();	
		Paging paging = new Paging(totalCount,curPage,listCount,pageCount);
		
		return paging;
	}

	@Override
	public Board csView(int board_no) { // 고객문의 상세정보 보이기
		
		return adminDao.selectBoardByBoardno(board_no);
	}

	@Override
	public void csInsertComment(Comment comment) { // 고객문의 댓글 입력
		
		adminDao.csInsertComment(comment);
	}

	@Override
	public boolean csDeleteComment(Comment comment) { // 댓글 삭제
		
		return false;
	}
	
	// -------------------- 축제 관리 --------------------
	
	@Override
	public List<Festival> festivalList(Paging paging) { // 이벤트 리스트
		
		return adminDao.festivalSelectAll(paging);
	}

	@Override
	public int getTotalFestivalCount() { // 총 이벤트 수 
		
		return adminDao.festivalSelectCntAll();
	}

	@Override
	public Paging getFestivalPaging(int curPage, int listCount, int pageCount) {
		
		// 페이징 처리
        int totalCount = this.getTotalFestivalCount();
		
		Paging paging = new Paging(totalCount,curPage,listCount,pageCount);
		
		return paging;
	}

	@Override
	public void delete(Festival festival) { // 축제 삭제
		
		adminDao.delete(festival);
	}

	@Override
	public void deleteFestivalList(String names) { // 축제 삭제
		
        // 축제 체크박스로 리스트에서 전체삭제 		
		adminDao.deleteFestivalList(names);
	}

	@Override
	public void writeFestival(Festival festival) { // 축제 글쓰기
		
		adminDao.insertFestival(festival);		
	}

	@Override
	public void updateFestival(Festival festival) { // 축제 글 수정
		
		adminDao.updateFestival(festival);
	}

}
