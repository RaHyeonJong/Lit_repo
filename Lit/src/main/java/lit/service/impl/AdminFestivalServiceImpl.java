package lit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lit.dao.face.AdminFestivalDao;
import lit.dto.Board;
import lit.service.face.AdminFestivalService;
import lit.util.Paging;

@Service
public class AdminFestivalServiceImpl implements AdminFestivalService {
	
	@Autowired AdminFestivalDao adminFestivalDao;

	@Override
	public List<Board> festivalList(Paging paging) { // 이벤트 리스트
		
		return adminFestivalDao.festivalSelectAll(paging);
	}

	@Override
	public int getTotalFestivalCount() { // 총 이벤트 수 
		
		return adminFestivalDao.festivalSelectCntAll();
	}

	@Override
	public Paging getPaging(int curPage, int listCount, int pageCount) {
		
		// 페이징 처리
        int totalCount = this.getTotalFestivalCount();
		
		Paging paging = new Paging(totalCount,curPage,listCount,pageCount);
		
		return paging;
	}

	@Override
	public Board viewFestival(int board_no) { // 축제 상세보기
		
		return adminFestivalDao.selectFestivalByBoardno(board_no);
	}

	@Override
	public void delete(Board festival) { // 축제 삭제
		
		adminFestivalDao.delete(festival);
	}

	@Override
	public void deleteFestivalList(String names) {
		
        // 축제 체크박스로 리스트에서 전체삭제 		
		adminFestivalDao.deleteFestivalList(names);
	}

	@Override
	public void writeFestival(Board festival) { // 축제 글쓰기
		
		adminFestivalDao.insertFestival(festival);		
	}

	@Override
	public void updateFestival(Board festival) {
		
		adminFestivalDao.updateFestival(festival);
	}

	
	
	

}
