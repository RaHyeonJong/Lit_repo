package lit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lit.dao.face.SearchDao;
import lit.dto.Board;
import lit.dto.Lodge;
import lit.service.face.SearchService;

@Service
public class SearchServiceImpl implements SearchService{

	@Autowired SearchDao searchDao;
	
	@Override
	public List<Lodge> getLocalLodgeList(String location) {
		
		return searchDao.selectLocalLodge(location);
	}

	@Override
	public List<Board> getLocalFestivalList(String location) {
		
		return searchDao.selectLocalFestival(location);
	}

	@Override
	public List<Lodge> getFilterLodgeList(Lodge filter) {
		
		return searchDao.selectFilterLodge(filter);
	}

}
