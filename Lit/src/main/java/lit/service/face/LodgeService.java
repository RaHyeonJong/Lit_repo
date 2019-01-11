package lit.service.face;


import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import lit.dto.Comment;
import lit.dto.Day_off;
import lit.dto.Favorite;
import lit.dto.Image;
import lit.dto.Lodge;
import lit.dto.Member;
import lit.dto.Message;
import lit.dto.Pay;
import lit.dto.Report;

public interface LodgeService {

	//숙소 번호를 받아와서 숙소 조회
	public Lodge LodgeView(Lodge lodge);
	
	//편의시설
	public List<String> LodgeConvenient(Lodge lodge);
	
	//편의공간
	public List<String> LodgeConvenientArea(Lodge lodge);
	
	
	//상세뷰 이미지
	public List<Image> LodgeImage(Lodge lodge);
	
	
	//예약 하고 자하는 숙소의 결제 정보 보여주기
	public Lodge LodgeReservationView(Lodge lodge);

	//결제하기
	public void LodgePay(Pay pay);

	//결제인원 
	public boolean SelectLodgePay(Pay pay);
	
	//후기 리스트
	public List<Comment> commentList(Lodge lodge);
	
	//후기 개수
	public int lodgeCountcomment(Lodge lodge);
	
	
	//후기입력
	public void insertComment(Comment comment);

	//후기 업데이트
	public void updateComment(Comment comment);
	//후기 삭제
	public void deleteComment(Comment comment);
	
	//대댓글 입력
	public void insertLodgeComment(Comment comment);
	
	//대댓글 리스트
	public List<Comment> replyList(Comment comment);
	
	//숙소 저장(좋아요)
	public void insertLike(Favorite favorite);
	public void deleteLike(Favorite favorite);
	public boolean selectLike(Member member);
	
	//호스트에게 메시지 보내기
	public void insertMessage(Message message);
	
	// 신고
	public void deleteReport(Report report);
	public boolean checkLodgeReport(Report report);
	public void reportLodge(Report report);
	public void insertReport(Report report);
	public boolean commentReport(Report report);
	public void deleteCommentReport(Report report);
	
	
	//휴무일
	public List<Day_off> selectDay(Lodge lodge);
	
	//예약 날짜 비활성
	public Set<String> reservationDay(Lodge lodge);
	
	//수용인원
//	public Pay stayHeads(Lodge lodge);
	
}
