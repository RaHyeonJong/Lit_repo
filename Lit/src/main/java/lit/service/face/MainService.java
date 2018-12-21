package lit.service.face;

import java.util.List;

import lit.dto.Board;
import lit.dto.Festival;
import lit.dto.Lodge;
import lit.dto.MapBounds;

public interface MainService {

	List<Lodge> getRecommendLodge(); // 숙소 추천 리스트(평점순)

	List<Festival> getRecommendFestivalList(); // 행사 추천 리스트(평점순)

	List<Lodge> getBestLodgeList(); // 최고 평점 숙소 리스트
	
	List<Festival> getBestFestivalList(); // 최고 평점 행사 리스트

	List<Lodge> getLocalLodgeList(String location); // 지역별 숙소 리스트 location에 지역명을 넣으면 됨(서울, 부산, 제주도 등등)

	List<Festival> getLocalFestivalList(String location); // 지역별 행사 리스트 location에 지역명을 넣으면 됨(서울, 부산, 제주도 등등)

	List<Lodge> getThemeLodgeList(String string); // 테마별 숙소 리스트

	List<Festival> getThemeFestivalList(String string); // 테마별 행사 리스트
	
	List<Lodge> getLodgeList(); // 모든 숙소 가져오기

	List<Lodge> getLodgeListByBounds(MapBounds bounds); // bounds 숙소 리스트

}
