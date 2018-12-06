package lit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lit.dao.face.MessageDao;
import lit.dto.Message;
import lit.service.face.MessageService;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired MessageDao messageDao;

	@Override
	public List<Message> messagelist() {

		return messageDao.messagelist();
		
	}

	@Override
	public Message messageView(Message message) {

		
		return messageDao.messageview(message);
		
	}


	@Override
	public void delete(Message message) {
		
		messageDao.delete(message);
	}

	@Override
	public void write(Message message) {
		
		messageDao.write(message);
	}
	
}
