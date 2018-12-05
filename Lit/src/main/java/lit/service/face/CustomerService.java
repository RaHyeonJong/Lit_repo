package lit.service.face;

import java.util.List;

import lit.dto.Board;
import lit.dto.Member;

public interface CustomerService {

	public void writer(Member member);
	
	public List<Board> list();
	
	public Board view(int boardno);
	
}
