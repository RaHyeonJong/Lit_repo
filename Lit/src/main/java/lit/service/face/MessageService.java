package lit.service.face;

import java.util.List;
import lit.dto.Message;
import lit.util.Paging;

public interface MessageService {

	//받는 리스트
	public List<Message> receivelist(Paging paging);
		
	//보낸 리스트
	public List<Message> sendlist(Paging paging);
	
	//전송
	public void sendwrite(Message message);

	//Header부분 쪽지 갯수
	public int messagecount(int receiver_no);
	
	//0에서 1로 변경
	public void countupdate(Message message);
	
	//마이페이지의 받은쪽지함의 카운트
	public int receivecount(int mem_no);
	
	//보낸쪽지함의 카운트
	public int sendcount(int mem_no);
	
	
	
}