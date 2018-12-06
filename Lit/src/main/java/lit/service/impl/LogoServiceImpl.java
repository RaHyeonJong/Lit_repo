package lit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lit.dao.face.LogoDao;
import lit.dto.Comment;
import lit.dto.Lodge;
import lit.dto.LodgeSearch;
import lit.service.face.LogoService;

@Service
public class LogoServiceImpl implements LogoService {

	@Autowired LogoDao logoDao;
	
	@Override
	public List<Lodge> getLodgeList(LodgeSearch search) {
		
		return logoDao.selectLodgeList(search);
	}

	@Override
	public List<String> getLocationAjaxList(String location) {
		
		return logoDao.selectLocationAjax(location);
	}

	@Override
	public List<Comment> getReviewList() {
		
		return logoDao.selectReview();
	}

}
