package lit.dao.face;

import java.util.List;

import lit.dto.Board;
import lit.dto.Comment;
import lit.util.Paging;


public interface AdminCsDao {
	
	// 고객센터 1:1 문의리스트
	List<Board> csSelectAll(Paging paging);
	
	// 전체 1:1문의 수 조회 (페이징 처리)
	public int csSelectCntAll();
	
	// 고객문의 상세 정보 반환  
	public Board selectBoardByBoardno(int board_no);
	
	// 코멘트 INSERT
	public void csInsertComment(Comment comment);
	
	// 댓글 삭제하기
	public void csDeleteComment(Comment comment);
	
	// 댓글 카운트 - 댓글 존재 여부 확인 
	public int csCountComment(Comment comment);
	
	
}
