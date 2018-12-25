package lit.dao.face;

import java.util.List;

import lit.dto.Board;
import lit.dto.Comment;

public interface CustomerServiceDao {

	//-문의내용 작성
	public void writer(Board board);

	//-문의내용 리스트
	public List<Board> boardlist(Board board);

	//-리스트에서 버튼 누르면 나오는 것
	public Board view(Board board);

	//관리자 답변 써주기 
	public void contentwriter(Comment comment);

	//관리자가 답변 써주면 answer 0에서 1로 수정
	public void updateanswer(Board board);
	
	//관리자 답변 수정
	public void updatecomment(Comment comment);
}
