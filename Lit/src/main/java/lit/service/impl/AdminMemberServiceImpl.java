package lit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lit.dao.face.AdminMemberDao;
import lit.dto.Member;
import lit.service.face.AdminMemberService;
import lit.util.Paging;


@Service
public class AdminMemberServiceImpl implements AdminMemberService {

	@Autowired AdminMemberDao adminMemberDao;
	
	@Override
	public List<Member> memberList(Paging paging) { // 멤버리스트 보이기
		
		return adminMemberDao.memberSelectAll(paging);
	}

	@Override
	public int getTotalMemberCount() { // 멤버 전체 수 조회
		
		return adminMemberDao.MemberSelectCntAll();
	}

	@Override
	public Paging getPaging(int curPage, int listCount, int pageCount) {
		
		// 페이징 처리
        int totalCount = this.getTotalMemberCount();
		
		Paging paging = new Paging(totalCount,curPage,listCount,pageCount);
		
		return paging;
	}

	@Override
	public Member viewMember(int mem_no) { // 멤버 정보 보이기
		
		return adminMemberDao.selectMemberByMemberno(mem_no);
	}

}
