package lit.dao.face;

import java.util.List;

import lit.dto.Message;

public interface MessageDao {

	//받은 쪽지함
	public List<Message> receivelist(Message message);
	
	//보낸 쪽지함
	public List<Message> sendlist(Message message);
	
	//쪽지 갯수
	public int messagecount(Message message);
	
	//사용자가 받은쪽지함에서 읽으면 하나씩 감소
	public void countupdate(Message message);
	
}