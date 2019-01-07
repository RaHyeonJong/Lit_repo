package lit.dao.face;

import java.util.List;

import lit.dto.Board;
import lit.dto.Comment;
import lit.dto.Festival;
import lit.dto.Lodge;
import lit.dto.Member;
import lit.dto.Pay;
import lit.util.Paging;

public interface AdminDao {
	
	    // -------------------- 회원관리 --------------------

	    // 멤버 리스트 보이기
		public List<Member> memberSelectAll(Paging paging);
		
		// 전체 멤버 수 보이기
		public int MemberSelectCntAll();
		
		// 멤버 상세 정보 반환 
		public Member selectMemberByMemberno(int mem_no);
		
		// 멤버 비활성화 ( 불량 멤버 비활성화 )
		public void updateMemberDisable(int activation);
		
		// -------------------- 숙소관리 --------------------
		
		// 숙소리스트 보이기
		public List<Lodge> lodgeSelectAll(Paging paging);
		
		// 전체 숙소 수 조회 (페이징 처리)
		public int lodgeSelectCntAll();
		
		// 숙소 활성화 ( 승인 및 숙소 일시정지(거절) )
		public void updateLodgeActivate(int activation);
		
		// -------------------- 결제 관리 --------------------
		
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
		
		// -------------------- 고객문의 관리 --------------------
		
		// 고객센터 1:1 문의리스트
		List<Board> csSelectAll(Paging paging);
		
		// 전체 1:1문의 수 조회 (페이징 처리)
		public int csSelectCntAll();
		
		// 고객문의 상세 정보 반환  
		public Board selectBoardByBoardno(int board_no);
		
		// 코멘트 INSERT
		public void csInsertComment(Comment comment);
		
		// 댓글 삭제하기
		public void csDeleteComment(Comment comment);
		
		// 댓글 카운트 - 댓글 존재 여부 확인 
		public int csCountComment(Comment comment);
		
		// -------------------- 축제 관리 --------------------
		
		// 축제 리스트 보이기
		public List<Festival> festivalSelectAll(Paging paging);
		
		// 전체 축제 수 조회 (페이징 처리)
		public int festivalSelectCntAll();
				
		// 축제 삭제
		public void delete(Festival festival);
		
		// 축제 체크박스로 선택 후 삭제하고 싶은 축제 전체삭제
		public void deleteFestivalList(String names);
		
		// 축제 게시판 글쓰기
		public void insertFestival(Festival festival);
		
		// 축제 게시판 수정
		public void updateFestival(Festival festival);
		
		
}
