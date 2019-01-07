package lit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lit.dao.face.MessageDao;
import lit.dto.Message;
import lit.service.face.MessageService;
import lit.util.Paging;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired MessageDao messageDao;

	//받은 쪽지함 리스트
	@Override
	public List<Message> receivelist(Paging paging) {
	
		return messageDao.receivelist(paging);
		
	}

	//보낸 쪽지함 리스트
	@Override
	public List<Message> sendlist(Paging paging) {
		return messageDao.sendlist(paging);
	}
	
	//전송
	@Override
	public void sendwrite(Message message) {

		messageDao.sendwrite(message);
		
	}

	@Override
	public int receivecount(int mem_no) {
		return messageDao.receivecount(mem_no);
	}
	
	@Override
	public int sendcount(int mem_no)
	{
		return messageDao.sendcount(mem_no);
	}

	@Override
	public int messagecount(Message message) {
		return messageDao.messagecount(message);
	}

	@Override
	public void countupdate(Message message) {

		messageDao.countupdate(message);
		
	}

	@Override
	public Message countList(Message message) {
		return messageDao.countList(message);
	}

	
	
}