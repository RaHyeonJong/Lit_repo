package lit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lit.dao.face.AdminCsDao;
import lit.dto.Board;
import lit.dto.Comment;
import lit.service.face.AdminCsService;
import lit.util.Paging;


@Service
public class AdminCsServiceImpl implements AdminCsService {
	
	@Autowired AdminCsDao adminCsDao;

	@Override
	public List<Board> csList(Paging payPaging) {
		
		return adminCsDao.csSelectAll(payPaging);
	}

	@Override
	public int getTotalCsCount() {
		
		return adminCsDao.csSelectCntAll();
	}

	@Override
	public Paging getPaging(int curPage, int listCount, int pageCount) {
		
		// 페이징 처리
        int totalCount = this.getTotalCsCount();	
		Paging paging = new Paging(totalCount,curPage,listCount,pageCount);
		
		return paging;
	}

	@Override
	public Board csView(int board_no) { // 고객문의 상세정보 보이기
		
		return adminCsDao.selectBoardByBoardno(board_no);
	}

	@Override
	public void csInsertComment(Comment comment) { // 고객문의 댓글 입력
		
		adminCsDao.csInsertComment(comment);
	}

	@Override
	public boolean csDeleteComment(Comment comment) { // 댓글 삭제
		
		return false;
	}
	

}
