package lit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lit.dao.face.MainDao;
import lit.dto.Festival;
import lit.dto.Lodge;
import lit.service.face.MainService;

@Service
public class MainServiceImpl implements MainService{

	@Autowired MainDao mainDao;
	
	@Override
	public List<Lodge> getRecommendLodge() {
		
		return mainDao.selectRecommendLodge();
	}

	@Override
	public List<Festival> getRecommendFestivalList() {
		
		return mainDao.selectRecommendFestival();
	}

	@Override
	public List<Lodge> getBestLodgeList() {

		return mainDao.selectBestLodge();
	}

	@Override
	public List<Lodge> getBestFestivalList() {
		
		return mainDao.selectBestFestival();
	}

	@Override
	public List<Lodge> getLocalFestivalList(String location) {
		
		return mainDao.selectLocalFestival(location);
	}

	@Override
	public List<Lodge> getLocalLodgeList(String location) {
		// TODO Auto-generated method stub
		return mainDao.selectLocalLodge(location);
	}

}
