package lit.dao.face;

import java.util.List;

import lit.dto.Board;

public interface CustomerServiceDao {

	//-문의내용 작성
	public void writer(Board board);

	//-문의내용 리스트
	public List<Board> boardlist(Board board);

	//-리스트에서 버튼 누르면 나오는 것
	public Board view(Board board);

	//답변 있는지 없는지 카운트 세주기
	public int checkanswer(Board board);
	
	
}
