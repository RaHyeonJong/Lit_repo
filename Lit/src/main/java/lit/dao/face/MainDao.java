package lit.dao.face;

import java.util.List;

import lit.dto.Board;
import lit.dto.Lodge;

public interface MainDao {

	List<Lodge> selectRecommendLodge(); // 추천 숙소 리스트(평점순)

	List<Board> selectRecommendFestival(); // 추천 행사 리스트(평점순)

	List<Lodge> selectBestLodge(); // 최고 평점 숙소 리스트
	
	List<Lodge> selectBestFestival(); // 최고 평점 행사 리스트

	List<Lodge> selectLocalLodge(String location); // 지역별 숙소 리스트

	List<Lodge> selectLocalFestival(String location); // 지역명 행사 리스트

	List<Lodge> selectThemeLodge(String theme); // 테마별 숙소 리스트

	List<Lodge> selectThemeFestival(String theme); // 테마별 행사 리스트

}
