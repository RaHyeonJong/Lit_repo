package lit.dao.face;

import java.util.List;

import lit.dto.Board;
import lit.dto.Comment;
import lit.dto.Festival;
import lit.dto.Image;
import lit.dto.Lodge;
import lit.dto.Member;
import lit.dto.Pay;
import lit.dto.Report;
import lit.util.Paging;

public interface AdminDao {
	
	// --------------------- 회원 관리 ---------------------
	
	// 멤버 리스트 보이기 
    public List<Member> memberSelectAll(Paging paging);
    
    // 일반 유저 멤버 수 보이기 
    public int userSelectCntAll();
    
    // 호스트 멤버 수 보이기
    public int hostSelectCntAll();
    
    // 멤버 상세 보이기
    public Member selectMemberByMemberno(int mem_no);

    
    // --------------------- 숙소 관리 ---------------------	
    
    // 숙소 리스트 보이기
	public List<Lodge> lodgeSelectAll(Paging paging);
	
	// 전체 비활성화 숙소 조회 (페이징 처리)
	public int lodgeActivation0CntAll();
	
	// 전체 활성화 숙소 조회 (페이징 처리)
	public int lodgeActivation1CntAll();
	
	// 숙소 활성화 ( 승인 및 숙소 일시정지(거절) )
	public void updateLodgeActivate(int lodge_no);
	
		
	// -------------------- 고객문의 관리 --------------------
	
	// 고객센터 1:1 문의리스트
	List<Board> csSelectAll(Paging paging);
	
	// 고객센터 답변 달린 게시글 수 구하기(페이징 처리)
	public int answer1CntAll();
	
	// 고객센터 답변 안 달린 게시글 수 구하기(페이징 처리)
	public int answer0CntAll();
	
	// -------------------- 축제 관리 --------------------
	
	// 축제 리스트 보이기
	public List<Festival> festivalSelectAll(Paging paging);
	
	// 전체 축제 수 조회 (페이징 처리)
	public int festivalSelectCntAll();
	
	// 축제 게시판 글쓰기
	public void insertFestival(Festival festival);
	
	// 축제 게시판 이미지 업로드(썸네일)
	public void insertFestiThumbNail(Image image);
	
    // 축제 상세 보이기
    public Festival selectFestivalByFestivalno(int festival_no);
	
	// -------------------- 결제 관리 --------------------	
	 
	// 결제 리스트 보이기
	public List<Pay> paySelectAll(Paging paging);
	
	// 환불 대기 중인 수 조회(페이징 처리) pay_state_no = 2 
	public int refundSelectCntAll();
	
	// 환불 완료 수 조회(페이징 처리) pay_state_no = 3	
	public int refundFinishSelectCntAll();
	
	// 정상 결제 완료 수 조회(페이징 처리) pay_state_no = 1
	public int paySelectCntAll();
	
	// 환불 승인 (pay_state_no = 2 -> pay_state_no 3)
	public void updateRefund(int pay_no);
	
	// -------------------- 신고 관리 --------------------	
	
	// 신고 멤버 리스트 보이기
	public List<Report> reportMemberSelectAll(Paging paging);
	
	// 회원 신고 수 관리(페이징 처리)
	public int reportMemberSelectCntAll();

	// 회원 비활성화 
	public void updateMemberActivation(int mem_no);
	
	// -----------------------
	// 신고 숙소 리스트 보이기
	public List<Report> reportLodgeSelectAll(Paging paging);
	
	// 숙소 신고 수 관리 (페이징 처리)
	public int reportLodgeSelectCntAll();
	
	// 숙소 비활성화 
	public void updateReportLodgeActivation(int lodge_no);	
	
	// -----------------------
	
	// 신고 댓글 리스트 보이기
	public List<Report> reportCommentSelectAll(Paging paging);
	
	// 댓글 신고 수 관리 (페이징 처리)
	public int reportCommentSelectCntAll();
	
	// 댓글 삭제
	public void deleteReportComment(int comment_no);	
		
	
	
	
	
}
