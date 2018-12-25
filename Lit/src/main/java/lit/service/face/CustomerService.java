package lit.service.face;

import java.util.List;

import lit.dto.Board;
import lit.dto.Comment;

public interface CustomerService {

	//문의내역 글쓰기
	public void writer(Board board);
	
	//문의내역 리스트 뿌려주기
	public List<Board> boardlist(Board board);
	
	//문의내역 상세페이지
	public Board boardview(Board board);

	//답변 글쓰기
	public void contentwriter(Comment comment);
	
	//답변을 쓰면 answer는 0에서 1로 바꿔준다
	public void updateanswer(Board board);
	
	public void updatecomment(Comment comment);
	
}