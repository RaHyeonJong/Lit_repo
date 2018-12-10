package lit.service.face;

import java.util.List;

import lit.dto.Board;
import lit.dto.Comment;
import lit.dto.Favorite;
import lit.dto.Member;
import lit.dto.Pay;

public interface MypageService {

	public void updateProfile(Member member);

	public List<Favorite> getFavoriteList(Member member);

	public void deleteFavorite(Member member, Favorite favorite);

	public List<Board> getMyboardList(Member member);

	public List<Comment> getMycommentList(Member member);

	public List<Pay> getPayList(Member member);

	public void updatePay(Pay pay, Member member);

}
