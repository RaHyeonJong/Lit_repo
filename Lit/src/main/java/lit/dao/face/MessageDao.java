package lit.dao.face;

import java.util.List;

import lit.dto.Message;

public interface MessageDao {

	public List<Message> receivelist(Message message);
	
	public List<Message> sendlist(Message message);
	
	
}