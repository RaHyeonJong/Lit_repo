package lit.service.face;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import lit.dto.Comment;
import lit.dto.Image;
import lit.dto.Lodge;
import lit.dto.Message;
import lit.dto.Pay;

public interface LodgeService {

	//숙소 번호를 받아와서 숙소 조회
	public Lodge LodgeView(Lodge lodge);
	
	public List LodgeConvenient(Lodge lodge);
	
	//상세뷰 이미지
	public List<Image> LodgeImage();
	
	
	//예약 하고 자하는 숙소의 결제 정보 보여주기
	public Lodge LodgeReservationView(Lodge lodge);

	//결제하기
	public void LodgePay(Pay pay);

	//후기 리스트
	public List<Comment> commentList();
	
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
	public void insertLike(Lodge lodge);

	//호스트에게 메시지 보내기
	public void insertMessage(Message message);
	// 신고
	public void insertReport(Lodge lodge);
	
}
