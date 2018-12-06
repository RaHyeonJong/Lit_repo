package lit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lit.dao.face.MypageDao;
import lit.dto.Board;
import lit.dto.Comment;
import lit.dto.Favorite;
import lit.dto.Member;
import lit.dto.Pay;
import lit.service.face.MypageService;

@Service
public class MypageServiceImpl implements MypageService{
	@Autowired MypageDao mypageDao;

	@Override
	public void updateProfile(Member member) {
		mypageDao.updateProfile(member);
	}

	@Override
	public List<Favorite> getFavoriteList(Member member) {
		
		return mypageDao.getFavoriteList(member);
	}

	@Override
	public void deleteFavorite(Member member, Favorite favorite) {

		mypageDao.deleteFavorite(member, favorite);
	}

	@Override
	public List<Board> getMyboardList(Member member) {
		
		return mypageDao.getMyboardList(member);
	}

	@Override
	public List<Comment> getMycommentList(Member member) {
		
		return mypageDao.getMycommentList(member);
	}

	@Override
	public List<Pay> getPayList(Member member) {
		return mypageDao.getPayList(member);
	}

	@Override
	public void updatePay(Pay pay, Member member) {
		mypageDao.updatePay(pay, member);
	}

}
