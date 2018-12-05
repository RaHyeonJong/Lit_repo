package lit.dao.face;

import java.util.List;

import lit.dto.Client;
import lit.dto.Inquiry;

public interface CustomerServiceDao {

	//-문의내용 작성

	public void writer(Client client);

	//-문의내용 리스트

	public List<Inquiry> list();

	//-리스트에서 버튼 누르면 나오는 것

	public Inquiry view(int boardno);

	
	
	
}
