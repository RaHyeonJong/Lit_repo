package lit.service.face;

import java.util.List;

import lit.dto.Board;
import lit.dto.Comment;
import lit.util.Paging;


public interface AdminCsService {
	
	// 고객문의ㅏ 리스트 보이기
	public List<Board> csList(Paging payPaging);
	
	// 전체 고객문의 수 조회
	public int getTotalCsCount();
	
	// 페이징 정보 만들기
	public Paging getPaging(int curPage, int listCount, int pageCount);
	
	// 고객문의 상세 정보 보이기
	public Board csView(int board_no);

	//댓글 입력
	public void csInsertComment(Comment comment);
	
	//댓글 삭제
	public boolean csDeleteComment(Comment comment);
}
