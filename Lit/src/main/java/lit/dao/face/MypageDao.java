package lit.dao.face;

import java.util.List;

import lit.dto.Comment;
import lit.dto.Favorite;
import lit.dto.Image;
import lit.dto.Lodge;
import lit.dto.Member;
import lit.dto.Pay;
import lit.dto.Report;
import lit.util.Paging;

public interface MypageDao {

	// 硫ㅻ쾭 �뾽�뜲�씠�듃�븯湲�
	public void updateProfile(Member member);

	// �봽濡쒗븘 �궗吏꾩쓣 �뾽�뜲�씠�듃
	public void updateMyPhoto(Image image);

	// �봽濡쒗븘 �궗吏꾩씠 �엳�뒗吏� �솗�씤 (update �븷嫄댁� insert �븷嫄댁� �뙋�떒�슜)
	public int checkMyPhoto(Image image);

	// mem_no�쑝濡� 硫ㅻ쾭 媛��졇�삤湲�
	public Member getMemberByNo(Member mem);

	// mem_no�쑝濡� �뙎湲� 紐⑸줉 媛��졇�삤湲�
	public List<Comment> getCommentList(Paging paging);

	// mem_no濡� �옉�꽦�븳 �뙎湲� �닔 議고쉶�븯湲�
	public int getTotalCommCnt(int mem_no);

	// mem_no濡� 李쒗븳 �닕�냼 �닔 議고쉶�븯湲�
	public int getTotalFavorCnt(int mem_no);

	// mem_no�쑝濡� 李쒖닕�냼 紐⑸줉 媛��졇�삤湲�
	public List<Favorite> getFavorList(Paging paging);

	// �듅�젙 李� �뜲�씠�꽣 �궘�젣�븯湲�
	public void deleteMyFavor(Favorite favor);

	// mem_no�쓽 援щℓ�궡�뿭 �닔 議고쉶�븯湲�
	public int getTotalPayCnt(int mem_no);

	// mem_no�쑝濡� 寃곗젣�궡�뿭 紐⑸줉 媛��졇�삤湲�
	public List<Pay> getPayList(Paging paging);

	// pay_no�쑝濡� 寃곗젣痍⑥냼�슂泥��븯湲�
	public void cancelPayment(Pay pay);

	// pay_no�쑝濡� 寃곗젣�젙蹂� 媛��졇�삤湲�
	public Pay getPay(Pay pay);

	// lodge_no�쑝濡� �닕�냼�젙蹂� 媛��졇�삤湲�
	public Lodge getLodge(Pay pay);

	// mem_no�쑝濡� �샇�뒪�듃 �젙蹂� 媛��졇�삤湲�
	public Member getHost(Lodge lodge);

	// 회원탈퇴 멤버 삭제하기
	public void deleteMember(Member mem);

	public int checkReport(Report report);

	public void reportMember(Report report);

}
