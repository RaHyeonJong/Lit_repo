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
	public List<Message> sendlist(Message message) {

		return messageDao.sendlist(message);
	}

	@Override
	public List<Message> receivelist(Message message) {
		
		return messageDao.receivelist(message);
	}


	
}
