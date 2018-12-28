package lit.service.face;

import java.util.List;

import lit.dto.Message;

public interface MessageService {

	public List<Message> sendlist(Message message);
	
	public List<Message> receivelist(Message message);
	

}
