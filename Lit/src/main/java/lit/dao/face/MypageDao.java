package lit.dao.face;

import java.util.List;

import lit.dto.Comment;
import lit.dto.Favorite;
import lit.dto.Image;
import lit.dto.Member;
import lit.dto.Pay;
import lit.util.Paging;

public interface MypageDao {

	// 멤버 업데이트하기
	public void updateProfile(Member member);

	// 프로필 사진을 업데이트
	public void updateMyPhoto(Image image);

	// 프로필 사진이 있는지 확인 (update 할건지 insert 할건지 판단용)
	public int checkMyPhoto(Image image);

	// mem_no으로 멤버 가져오기
	public Member getMemberByNo(Member mem);

	// mem_no으로 댓글 목록 가져오기
	public List<Comment> getCommentList(Paging paging);

	// mem_no로 작성한 댓글 수 조회하기
	public int getTotalCommCnt(int mem_no);

	// mem_no로 찜한 숙소 수 조회하기
	public int getTotalFavorCnt(int mem_no);

	// mem_no으로 찜숙소 목록 가져오기
	public List<Favorite> getFavorList(Paging paging);

	// 특정 찜 데이터 삭제하기
	public void deleteMyFavor(Favorite favor);

	// mem_no의 구매내역 수 조회하기
	public int getTotalPayCnt(int mem_no);

	// mem_no으로 결제내역 목록 가져오기
	public List<Pay> getPayList(Paging paging);

}
