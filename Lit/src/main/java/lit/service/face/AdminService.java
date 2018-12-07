package lit.service.face;

import java.util.List;

import lit.dto.Board;
import lit.dto.Comment;
import lit.dto.Lodge;
import lit.dto.Member;
import lit.dto.Pay;
import lit.util.Paging;

public interface AdminService {

	// -------------------- 회원관리 --------------------

	// 멤버 리스트 보이기
	public List<Member> memberList(Paging paging);

	// 전체 멤버 수 조회
	public int getTotalMemberCount();

	// 페이징 정보 만들기
	public Paging getMemberPaging(int curPage, int listCount, int pageCount);

	// 멤버 상세 정보 조회
	public Member viewMember(int mem_no);

	// 멤버 비활성화 시키기
	public void memberDisable(int activation);

	// -------------------- 숙소관리 --------------------

	// 숙소리스트 보이기
	public List<Lodge> getLudgeList(Paging paging);

	// 페이징 정보 만들기
	public Paging getLodgePaging(int curPage, int listCount, int pageCount);

	// 전체 숙소 수 조회
	public int getTotalLudgeCount();

	// 숙소 비활성화 시키기
	public void lodgeDisable(int activation);
	
	// -------------------- 결제관리 --------------------

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
	public Pay viewPay(int pay_state);
	
	// 환불 승인
	public void refundAccess(int activation);
	
	// -------------------- 고객문의 관리 --------------------
	
	// 고객문의  리스트 보이기
	public List<Board> csList(Paging paging);
	
	// 전체 고객문의 수 조회
	public int getTotalCsCount();
	
	// 페이징 정보 만들기
	public Paging getCsPaging(int curPage, int listCount, int pageCount);
	
	// 고객문의 상세 정보 보이기
	public Board csView(int board_no);

	//댓글 입력
	public void csInsertComment(Comment comment);
	
	//댓글 삭제
	public boolean csDeleteComment(Comment comment);
	
	// -------------------- 축제 관리 --------------------
	
	// 행사 리스트 보이기
	public List<Festival> festivalList(Paging paging);
	
	// 전체 축제 수 조회
	public int getTotalFestivalCount();
	
	// 페이징 정보 만들기
	public Paging getFestivalPaging(int curPage, int listCount, int pageCount);
	
	// 축제 삭제하기
	public void delete(Festival festival);
	
	// 축제 체크박스로 리스트에서 삭제하기
	public void deleteFestivalList(String names);
	
	// 축제 글쓰기
	public void writeFestival(Festival festival);
	
	// 축제 글 수정
	public void updateFestival(Festival festival);

}
