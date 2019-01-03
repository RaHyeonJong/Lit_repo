package lit.service.impl;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lit.dao.face.LodgeDao;
import lit.dto.Comment;
import lit.dto.Day_off;
import lit.dto.Favorite;
import lit.dto.Image;
import lit.dto.Lodge;
import lit.dto.Member;
import lit.dto.Message;
import lit.dto.Pay;
import lit.dto.Report;
import lit.service.face.LodgeService;

@Service
public class LodgeServiceImpl implements LodgeService {

	
	@Autowired LodgeDao lodgedao;

	@Override
	public Lodge LodgeView(Lodge lodge) {
	
		return lodgedao.SelectLodgeView(lodge);

	
	}

	@Override
	public List<Image> LodgeImage() {
		
		return lodgedao.SelectLodgeImage();
	}

	@Override
	public List LodgeConvenient(Lodge lodge) {
		lodgedao.selectConvenient(lodge);
		String[] sub = lodge.getConvenient_facility().split("#"); 
		List<String> list = new ArrayList<>();
		for(String conven : sub) {
			  list.add(conven);
		}
		
		return list; 
	}

	
	@Override
	public Lodge LodgeReservationView(Lodge lodge) {
		
			return	lodgedao.SelectLodgeReservation(lodge);
	}

	@Override
	public void LodgePay(Pay pay) {

		
		lodgedao.payment(pay);
	}

	@Override
	public boolean SelectLodgePay(Pay pay) {
	
		int cnt = lodgedao.SelectPayment(pay);
		if(cnt <1) {
			
			return false;
		}
			return true;
		
		
	}
	
	
	@Override
	public List<Comment> commentList() {
		// TODO Auto-generated method stub
		return lodgedao.lodgeComment();
	}

	
	
	@Override
	public void insertComment(Comment comment) {

		lodgedao.insertReview(comment);
		
	}

	@Override
	public void updateComment(Comment comment) {
		
		lodgedao.updateReview(comment);
	}

	
	
	@Override
	public void deleteComment(Comment comment) {
		lodgedao.deleteReview(comment);
	}
	
	@Override
	public void insertLodgeComment(Comment comment) {
		
		lodgedao.insertLodgeReply(comment);
	}


	@Override
	public List<Comment> replyList(Comment comment) {
		
		return lodgedao.lodgeReply(comment);
	}
	
	
	@Override
	public int lodgeCountcomment(Lodge lodge) {
		
		return lodgedao.commentCount(lodge);
	}

	
	
	
	@Override
	public void insertLike(Favorite favorite) {
	
		 lodgedao.insertlodgetLike(favorite);
		
	}
	
	@Override
	public void deleteLike(Favorite favorite) {
		
		lodgedao.deleteFavorite(favorite);
	}
	
	
	
	@Override
	public boolean selectLike(Favorite favorite) {
		
		if(lodgedao.selectFavorite(favorite) < 1){
			
			return  true;
		}else{
			
			return false;
		}
			
	
	}
	
	@Override
	public void insertMessage(Message message) {
		lodgedao.insertContent(message);
		
	}

	@Override
	public List<Day_off> selectDay(Lodge lodge) {
		
		
		return lodgedao.selectday_off(lodge);
	}

	

	@Override
	public void deleteReport(Report report) {
		
		lodgedao.deleteLodgeReport(report);		
	}

	@Override
	public boolean checkLodgeReport(Report report) {
		
		int cnt = lodgedao.selectReport(report);
		if(cnt == 1)
			return true;
		return false;
	}

	@Override
	public void reportLodge(Report report) {
		lodgedao.insertLodgeReport(report);
		
	}








	
	



	
	
	
	
}
