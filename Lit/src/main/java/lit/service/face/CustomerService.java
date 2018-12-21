package lit.service.face;

import java.util.List;

import lit.dto.Board;

public interface CustomerService {

	//문의내역 글쓰기
	public void writer(Board board);
	
	//문의내역 리스트 뿌려주기
	public List<Board> boardlist(Board board);
	
	//문의내역 상세페이지
	public Board boardview(Board board);
	
}