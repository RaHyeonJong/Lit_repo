package lit.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lit.dao.face.FestivalDao;
import lit.dto.Board;
import lit.service.face.FestivalService;


@Service
public class FestivalServiceImpl implements FestivalService {
	
	@Autowired FestivalDao festivalDao;

	@Override
	public Board viewFestival(int board_no) { // 축제 상세 정보 보이기
		
		return festivalDao.selectFestivalByBoardno(board_no);
	}

}
