package lit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lit.dao.face.CustomerServiceDao;
import lit.dto.Board;
import lit.service.face.CustomerService;

@Service
public class CustomerSerivceImpl implements CustomerService{

	@Autowired CustomerServiceDao customerserviceDao;

	@Override
	public void writer(Board board) {
		customerserviceDao.writer(board);
	}

	@Override
	public List<Board> boardlist(Board board) {
		return customerserviceDao.boardlist(board);
	}

	@Override
	public Board boardview(Board board) {
		return customerserviceDao.view(board);
	}
	
}