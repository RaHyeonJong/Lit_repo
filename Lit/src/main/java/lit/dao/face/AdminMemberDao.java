package lit.dao.face;

import java.util.List;

import lit.dto.Member;
import lit.util.Paging;

public interface AdminMemberDao {
	
	// 멤버 리스트 보이기
	public List<Member> memberSelectAll(Paging paging);
	
	// 전체 멤버 수 보이기
	public int MemberSelectCntAll();
	
	// 멤버 상세 정보 반환 
	public Member selectMemberByMemberno(int mem_no);
	
	// 멤버 비활성화 ( 불량 멤버 비활성화 )
	public void updateMemberDisable(int activation);
    
}
