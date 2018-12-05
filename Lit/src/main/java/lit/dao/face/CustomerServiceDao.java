package lit.dao.face;

import java.util.List;

<<<<<<< HEAD
import lit.dto.Member;


=======
import lit.dto.Board;
import lit.dto.Member;
>>>>>>> branch 'master' of https://github.com/RaHyeonJong/Lit_repo.git

public interface CustomerServiceDao {

	//-문의내용 작성

	public void writer(Member member);

	//-문의내용 리스트
<<<<<<< HEAD
	
=======

>>>>>>> branch 'master' of https://github.com/RaHyeonJong/Lit_repo.git
	public List<Board> list();

	//-리스트에서 버튼 누르면 나오는 것

	public Board view(int boardno);

	
	
}
