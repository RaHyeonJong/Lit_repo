package lit.service.face;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;

import lit.dto.Board;
import lit.dto.Comment;
import lit.dto.Festival;
import lit.dto.Image;
import lit.dto.Lodge;
import lit.dto.Member;
import lit.dto.Pay;
import lit.dto.Report;
import lit.util.Paging;

public interface AdminService {
	
	// --------------------- 회원관리 ---------------------
	
	// 멤버 리스트 보이기
	public List<Member> memberList(Paging paging);
	
	// 일반 유저 수 전체 조회
	public int getTotalUserCount();
	
	// 호스트 수 전체 조회
	public int getTotalHostCount();
	
	// 멤버 페이징 정보 만들기
	public Paging getMemberPaging(int curPage, int listCount, int pageCount, int mem_case_no);
	
	// 멤버 상세 정보 보이기
	public Member viewMember(int mem_no);
	
	// --------------------- 숙소관리 ---------------------
	
	// 숙소리스트 보이기
	public List<Lodge> getLudgeList(Paging paging);
	
	// 비활성화 숙소 수 조회
	public int getLudgeActivation0Count();
	
	// 활성화 숙소 수 조회
	public int getLudgeActivation1Count();
	
	// 페이징 정보 만들기
	public Paging getLodgePaging(int curPage, int listCount, int pageCount, int lodge_activation);
	
	// 숙소 비활성화 시키기
	public void lodgeActivaiton(int lodge_no);
	
	
	// -------------------- 고객문의 관리 --------------------
	
	// 고객문의  리스트 보이기
	public List<Board> csList(Paging paging);
	
	// 답변 달린 고객문의 수 조회
	public int getTotalAnswer1Count();
	
	// 답변 안 달린 고객문의 수 조회
	public int getTotalAnser0Count();
	
	// 페이징 정보 만들기
	public Paging getCsPaging(int curPage, int listCount, int pageCount, int answer);
	

	// -------------------- 축제 관리 --------------------
	
	// 행사 리스트 보이기
	public List<Festival> festivalList(Paging paging);
	
	// 전체 축제 수 조회
	public int getTotalFestivalCount();
	
	// 페이징 정보 만들기
	public Paging getFestivalPaging(int curPage, int listCount, int pageCount);
	
	// 축제 글쓰기
	public void writeFestival(Festival festival);
	
	// 축제 썸네일 업로드 
	public void uploadThumbNail(ServletContext context, MultipartFile multipartFile, Image image);

	
	// -------------------- 결제 관리 --------------------
	
	// 결제 리스트 보이기
	public List<Pay> payList(Paging paging);
	
	// 환불 대기 결제 수 조회
	public int getTotalRefundCount();
	
	// 환불 완료 결제 수 조회
	public int getTotalRefundFinishCount();
	
	// 정상 결제 수 조회
	public int getTotalPayCount();
	
	// 페이징 정보 만들기
	public Paging getPayPaging(int curPage, int listCount, int pageCount, int pay_state_no);
	
	// 환불 승인하기
	public void approveRefund(int pay_no);
	
	
	// -------------------- 신고 관리 --------------------
	
	// 신고 멤버 리스트 보이기
	public List<Report> memberReportList(Paging paging);
	
	// 신고 멤버 수 조회
	public int getTotalReportMemberCount();
	
	// 페이징 정보 만들기
	public Paging getReportMemberPaging(int curPage, int listCount, int pageCount);
	
	// 멤버 비활성화 시키기
	public void MemberDisable(int mem_no);
	
	// 신고 숙소 리스트 보이기
	public List<Report> lodgeReportList(Paging paging);	
	
	// 신고 숙소 수 조회
	public int getTotalReportLodgeCount();
	
	// 페이징 정보 만들기
	public Paging getReportLodgePaging(int curPage, int listCount, int pageCount);
	
	// 멤버 비활성화 시키기
	public void LodgeDisable(int lodge_no);
	
	// 신고 댓글 리스트 보이기
	public List<Report> commentReportList(Paging paging);
	
	// 신고 댓글 수 
	public int getTotalReportCommentCount();
	
	// 페이징 정보 만들기
	public Paging getReportCcommentPaging(int curPaging, int listCount, int pageCount);
	
	// 신고 댓글 삭제 
	public void deleteReportComment(int comment_no);
	
	
	
}
