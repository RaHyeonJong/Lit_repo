package lit.service.face;

import java.util.List;

import lit.dto.Board;
import lit.util.Paging;

public interface AdminFestivalService {
	
	// 행사 리스트 보이기
	public List<Board> festivalList(Paging paging);
	
	// 전체 축제 수 조회
	public int getTotalFestivalCount();
	
	// 페이징 정보 만들기
	public Paging getPaging(int curPage, int listCount, int pageCount);
	
	// 축제 상세 정보 보이기
	public Board viewFestival(int board_no); 
	
	// 축제 삭제하기
	public void delete(Board festival);
	
	// 축제 체크박스로 리스트에서 삭제하기
	public void deleteFestivalList(String names);
	
	// 축제 글쓰기
	public void writeFestival(Board festival);
	
	// 축제 글 수정
	public void updateFestival(Board festival);

}
