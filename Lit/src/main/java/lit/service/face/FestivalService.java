package lit.service.face;

import java.util.List;

import lit.dto.Board;


public interface FestivalService {
	
	// 행사 리스트 보이기
	public List<Board> festivalList( );
	
	// 축제 상세 정보 보이기
	public Board viewFestival(int board_no); 

}
