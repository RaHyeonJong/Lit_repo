package lit.service.face;

import java.util.List;

import lit.dto.Lodge;
import lit.dto.Room;
import lit.util.Paging;


public interface AdminLodgeService {

	// 숙소리스트 보이기
	public List<Lodge> getLudgeList(Paging paging);
	
	// 전체 숙소 수 조회
	public int getTotalLudgeCount();
	
	// 페이징 정보 만들기
	public Paging getPaging(int curPage, int listCount, int pageCount);
	
	// 숙소 상세 정보 보이기
	public Lodge viewLodge(int lodge_no); 
	
	// 방 상세 정보 보이기
	public Room viewRoom(int room_no);
		
	// 숙소 삭제하기
	public void delete(Lodge lodge);
	
	// 방 정보 삭제하기
	public void delete(Room room);
	
	// 숙소 체크박스로 리스트에서 삭제하기
	public void deleteLudgeList(String names);
	
	
	
	
}
