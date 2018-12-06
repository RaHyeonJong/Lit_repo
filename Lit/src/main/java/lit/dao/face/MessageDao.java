package lit.dao.face;

import java.util.List;

import lit.dto.Message;

public interface MessageDao {

	public List<Message> messagelist();
	
	public void delete(Message message);
	
	public void write(Message message);

	public Message messageview(Message message);
	
}