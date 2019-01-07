package lit.dao.face;

import java.util.List;

import lit.dto.Board;
import lit.dto.Festival;
import lit.dto.Lodge;
import lit.dto.MapBounds;
import lit.dto.SearchFilter;

public interface MainDao {

	List<Lodge> selectRecommendLodge(); // 추천 숙소 리스트(평점순)

	List<Festival> selectRecommendFestival(); // 추천 행사 리스트(평점순)

	List<Lodge> selectBestLodge(); // 최고 평점 숙소 리스트
	
	List<Festival> selectBestFestival(); // 최고 평점 행사 리스트

	List<Lodge> selectLocalLodge(String location); // 지역별 숙소 리스트

	List<Festival> selectLocalFestival(String location); // 지역명 행사 리스트

	List<Lodge> selectThemeLodge(String theme); // 테마별 숙소 리스트

	List<Festival> selectThemeFestival(String theme); // 테마별 행사 리스트

	List<Lodge> selectLodge(); // 모든 숙소 리스트

	List<Lodge> selectLodgeByBounds(SearchFilter searchFilter);

	List<Lodge> selectLodgeSearch(SearchFilter searchFilter);

	String[] selectLodgeName(int lodge_no);

}
