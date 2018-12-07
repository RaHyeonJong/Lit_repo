package lit.service.face;

import java.util.List;

import lit.dto.Member;
import lit.util.Paging;

public interface AdminMemberService {

	// 멤버 리스트 보이기
	public List<Member> memberList(Paging paging);
	
	// 전체 멤버 수 조회
	public int getTotalMemberCount();
	
	// 페이징 정보 만들기
	public Paging getPaging(int curPage, int listCount, int pageCount);
	
	// 멤버 상세 정보 조회
	public Member viewMember(int mem_no);
}
