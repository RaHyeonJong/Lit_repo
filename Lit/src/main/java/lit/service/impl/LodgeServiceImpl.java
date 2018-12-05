package lit.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lit.dao.face.LodgeDao;
import lit.dto.Comment;
import lit.dto.Lodge;
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
	public boolean LodgeReservationView(Pay pay) {
		
				lodgedao.SelectLodgeReservation(pay);
		return false;
	}

	@Override
	public void LodgePay(Pay pay) {

		lodgedao.payment(pay);
	}

	@Override
	public void insertComment(Comment comment) {
		
		lodgedao.insertReview(comment);
	}

	@Override
	public void insertLike(Lodge lodge) {
	
		lodgedao.inserlodgetLike(lodge);
		
	}

	@Override
	public void insertReport(Lodge lodge) {
		lodgedao.insertlodgeReport(lodge);
		
	}



	
	
	
	
}
