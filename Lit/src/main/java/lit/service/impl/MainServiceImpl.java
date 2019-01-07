package lit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lit.dao.face.MainDao;
import lit.dto.Festival;
import lit.dto.Lodge;
import lit.dto.MapBounds;
import lit.dto.SearchFilter;
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
	public List<Festival> getBestFestivalList() {
		
		return mainDao.selectBestFestival();
	}

	@Override
	public List<Festival> getLocalFestivalList(String location) {
		
		return mainDao.selectLocalFestival(location);
	}

	@Override
	public List<Lodge> getLocalLodgeList(String location) {
		// TODO Auto-generated method stub
		return mainDao.selectLocalLodge(location);
	}

	@Override
	public List<Lodge> getThemeLodgeList(String theme) {
		
		return mainDao.selectThemeLodge(theme);
	}

	@Override
	public List<Festival> getThemeFestivalList(String theme) {
		
		return mainDao.selectThemeFestival(theme);
	}

	@Override
	public List<Lodge> getLodgeList() {
		// TODO Auto-generated method stub
		return mainDao.selectLodge();
	}

	@Override
	public List<Lodge> getLodgeListByBounds(SearchFilter searchFilter) {
		// TODO Auto-generated method stub
		return mainDao.selectLodgeByBounds(searchFilter);
	}

	@Override
	public List<Lodge> getSearchList(SearchFilter searchFilter) {
		// TODO Auto-generated method stub
		return mainDao.selectLodgeSearch(searchFilter);
	}

	@Override
	public String[] getLodgeImageName(int lodge_no) {
		// TODO Auto-generated method stub
		return mainDao.selectLodgeName(lodge_no);
	}

}
