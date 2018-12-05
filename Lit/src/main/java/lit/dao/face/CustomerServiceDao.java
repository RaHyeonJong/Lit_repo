package lit.dao.face;

import java.util.List;

import lit.dto.Member;



public interface CustomerServiceDao {

	//-문의내용 작성

	public void writer(Member member);

	//-문의내용 리스트
	
	public List<Board> list();

	//-리스트에서 버튼 누르면 나오는 것

	public Board view(int boardno);

	
	
}
