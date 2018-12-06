package lit.service.face;

import java.util.List;

import lit.dto.Message;

public interface MessageService {

	//메시지 리스트 뿌려주기
	public List<Message> messagelist();
	
	//해당 번호 누르면 그 번호의 값 나옴
	public Message messageView(Message message);
	
	
	//메시지 삭제
	public void delete(Message message);
	
	//메시지 쓰기
	public void write(Message message);

}
