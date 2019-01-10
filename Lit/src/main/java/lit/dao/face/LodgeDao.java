package lit.dao.face;


import java.util.List;

import lit.dto.Comment;
import lit.dto.Day_off;
import lit.dto.Favorite;
import lit.dto.Image;
import lit.dto.Lodge;
import lit.dto.Member;
import lit.dto.Message;
import lit.dto.Pay;
import lit.dto.Report;

public interface LodgeDao {

	
	//상세뷰 보여주기
	public Lodge SelectLodgeView(Lodge lodge);
	
	//편의시설 스플릿 
	public List<String> selectConvenient(Lodge lodge);
	
	//편의공간
	public List<String> selectConvenientArea(Lodge lodge);
	
	//상세뷰 이미지
	public List<Image> SelectLodgeImage(Lodge lodge);
	
	
	//예약뷰 보여주기 
	public Lodge SelectLodgeReservation(Lodge lodge);
	
	//결제하기
	public void payment(Pay pay);
	
	public int SelectPayment(Pay pay);
	
	//후기 리스트
	public List<Comment> lodgeComment(Lodge lodge);
	
	//댓글 개수 
	public int commentCount(Lodge lodge);
	
	//후기 입력
	public void insertReview(Comment comment);
	
	//후기 업데이트
	public void updateReview(Comment comment);
	//후기 삭제
	public void deleteReview(Comment comment);
	
	//대댓글 입력
	public void insertLodgeReply(Comment comment);
	
	//대댓글 리스트
	public List<Comment> lodgeReply(Comment comment);
	
	//좋아요(숙소 저장)
	public void insertlodgetLike(Favorite favorite);
	public void deleteFavorite(Favorite favorite);
	public int selectFavorite(Member member);
	
	//호스트에게 메시지 보내기
	public void insertContent(Message message);
	
	//숙소 신고하기
	public void insertLodgeReport(Report report);
	public void deleteLodgeReport(Report report);
	public int selectReport(Report report);
	public void insertCommentReport(Report report);
	public int reportComment(Report report);
	public void deleteReportComment(Report report);
	
	//휴무일
	public List<Day_off> selectday_off(Lodge lodge);
	
	//예약날짜
	public List<Pay> reservationDay_off(Lodge lodge);
	
	public Pay heads(Pay pay);
	
}
