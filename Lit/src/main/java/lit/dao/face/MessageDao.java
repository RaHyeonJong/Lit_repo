package lit.dao.face;

import java.util.List;

import lit.dto.Message;
import lit.util.Paging;

public interface MessageDao {

	//받은 쪽지함
	public List<Message> receivelist(Paging paging);
	
	//받은 쪽지함 카운트
	public int receivecount(int mem_no);
	
	//보낸 쪽지함
	public List<Message> sendlist(Paging paging);
	
	//보낸 쪽지함 카운트
	public int sendcount(int mem_no);
	
	//로그인 상단에 쪽지 갯수
	public int messagecount(Message message);
	
	//받은쪽지함이든 보낸쪽지함이든 누르면 읽지 않음에서 읽음으로 변경
	public void countupdate(Message message);

	public Message countList(Message message);
	
	//쪽지 쓰기
	public void sendwrite(Message message);
	
	
	
}