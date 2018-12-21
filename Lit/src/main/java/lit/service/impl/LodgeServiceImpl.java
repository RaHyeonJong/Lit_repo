package lit.service.impl;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lit.dao.face.LodgeDao;
import lit.dto.Comment;
import lit.dto.Image;
import lit.dto.Lodge;
import lit.dto.Message;
import lit.dto.Pay;
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
	public boolean LodgeReservationView(Pay pay) {
		
				lodgedao.SelectLodgeReservation(pay);
		return false;
	}

	@Override
	public void LodgePay(Pay pay) {

		lodgedao.payment(pay);
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
	public List<Comment> replyList() {
		
		return lodgedao.lodgeReply();
	}
	
	@Override
	public void insertLike(Lodge lodge) {
	
		lodgedao.inserlodgetLike(lodge);
		
	}

	@Override
	public void insertReport(Lodge lodge) {
		lodgedao.insertlodgeReport(lodge);
		
	}

	@Override
	public void insertMessage(Message message) {
		lodgedao.insertContent(message);
		
	}





	
	



	
	
	
	
}
