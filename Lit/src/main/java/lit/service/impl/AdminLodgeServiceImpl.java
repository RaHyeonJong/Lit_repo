package lit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lit.dao.face.AdminLodgeDao;
import lit.dto.Lodge;
import lit.dto.Room;
import lit.service.face.AdminLodgeService;
import lit.util.Paging;

@Service
public class AdminLodgeServiceImpl implements AdminLodgeService {

	@Autowired AdminLodgeDao adminDao;
		
	@Override
	public List<Lodge> getLudgeList(Paging paging) { // 숙소 리스트 

		return adminDao.lodgeSelectAll(paging);
	}

	@Override
	public int getTotalLudgeCount() { // 총 숙소 수

		return adminDao.lodgeSelectCntAll();
	}

	@Override
	public Paging getPaging(int curPage, int listCount, int pageCount) {

		// 페이징 처리
        int totalCount = this.getTotalLudgeCount();
		
		Paging paging = new Paging(totalCount,curPage,listCount,pageCount);
		
		return paging;
	}

	@Override
	public Lodge viewLodge(int lodge_no) { // 숙소 상세 정보 보이기
		
		return adminDao.selectLodgeByLodgeno(lodge_no);
	}
	
	@Override
	public Room viewRoom(int room_no) { // 방 상세정보 보이기

		return adminDao.selectRoomByRoomno(room_no);
	}

	@Override
	public void delete(Lodge lodge) { // 숙소 삭제하기
		
		adminDao.delete(lodge);
	}

	@Override
	public void deleteLudgeList(String names) { // 체크박스로 숙소리스트에서 삭제하기
		
		adminDao.deleteLodgeList(names);
	}

	@Override
	public void delete(Room room) {

		adminDao.delete(room);
	}

	
}
