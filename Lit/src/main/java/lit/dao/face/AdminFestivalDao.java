package lit.dao.face;

import java.util.List;

import lit.dto.Board;
import lit.util.Paging;

public interface AdminFestivalDao {

	// 행사 리스트 보이기
	public List<Board> festivalSelectAll(Paging paging);
	
	// 전체 축제 수 조회 (페이징 처리)
	public int festivalSelectCntAll();
	
	// 축제 상세조회 반환
	public Board selectFestivalByBoardno(int board_no);
	
	// 축제 삭제
	public void delete(Board festival);
	
	// 축제 체크박스로 선택 후 삭제하고 싶은 축제 전체삭제
	public void deleteFestivalList(String names);
	
	// 축제 게시판 글쓰기
	public void insertFestival(Board festival);
	
	// 축제 게시판 수정
	public void updateFestival(Board festival);
		
}
