package lit.dao.face;

import java.util.List;

import lit.dto.Board;


public interface FestivalDao {
	
	// 행사 정보 담긴 리스트 
	public List<Board> festivalSelectAll();
	
	// 행사 정보 상세조회 반환
	public Board selectFestivalByBoardno(int board_no);
	
	

}
