package lit.dao.face;


import java.util.List;

import lit.dto.Comment;
import lit.dto.Image;
import lit.dto.Lodge;
import lit.dto.Message;
import lit.dto.Pay;

public interface LodgeDao {

	
	//상세뷰 보여주기
	public List<Lodge> SelectLodgeView();
	
	//상세뷰 이미지
	public List<Image> SelectLodgeImage();
	
	//예약뷰 보여주기 
	public Pay SelectLodgeReservation(Pay pay);
	
	//결제하기
	public void payment(Pay pay);
	
	//후기 입력
	public void insertReview(Comment comment);
	
	public void deleteReview(Comment comment);
	
	//좋아요(숙소 저장)
	public void inserlodgetLike(Lodge lodge);

	//호스트에게 메시지 보내기
	public void insertContent(Message message);
	
	//숙소 신고하기
	public void insertlodgeReport(Lodge lodge);
}
