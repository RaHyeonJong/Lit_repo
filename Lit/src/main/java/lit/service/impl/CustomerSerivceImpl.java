package lit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lit.dao.face.CustomerServiceDao;
import lit.dto.Client;
import lit.dto.Inquiry;
import lit.service.face.CustomerService;

@Service
public class CustomerSerivceImpl implements CustomerService{

	@Autowired CustomerServiceDao customerserviceDao;

	@Override
	public void writer(Client client) {

		customerserviceDao.writer(client);
	}

	@Override
	public List<Inquiry> list() {

		return customerserviceDao.list();
	}

	@Override
	public Inquiry view(int boardno) {

		return customerserviceDao.view(boardno);
	}
	
}
