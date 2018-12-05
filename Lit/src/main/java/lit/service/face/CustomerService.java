package lit.service.face;

import java.util.List;

import lit.dto.Client;
import lit.dto.Inquiry;

public interface CustomerService {

	public void writer(Client client);
	
	public List<Inquiry> list();
	
	public Inquiry view(int boardno);
	
}
