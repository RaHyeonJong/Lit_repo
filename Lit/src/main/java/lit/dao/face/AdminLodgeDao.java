package lit.dao.face;

import java.util.List;

import lit.dto.Lodge;
import lit.dto.Room;
import lit.util.Paging;


public interface AdminLodgeDao {

	// 숙소리스트 보이기
	public List<Lodge> lodgeSelectAll(Paging paging);
	
	// 전체 숙소 수 조회 (페이징 처리)
	public int lodgeSelectCntAll();
		
	// 숙소 상세조회 반환
	public Lodge selectLodgeByLodgeno(int lodge_no);
	
	// 방 상세조회 반환
    public Room selectRoomByRoomno(int room_no);
    
	// 숙소 활성화 ( 승인 및 숙소 일시정지(거절) )
	public void updateLodgeActivate(int activation);
	
	// 숙소 삭제 ( 신고 많거나 불량 숙소 삭제 )
	public void delete(Lodge lodge);
	
	// 방 정보 삭세 
	public void delete(Room room);
	
	// 숙소 체크박스로 선택 후 비활성화 된 숙소 전체삭제
	public void deleteLodgeList(String names);
	
	
}
