package lit.dao.face;

import java.util.List;

import lit.dto.Festival;
import lit.dto.Lodge;

public interface SearchDao {

	List<Lodge> selectLocalLodge(String location); // 지역 숙소 검색 리스트

	List<Festival> selectLocalFestival(String location); // 지역 행사 검색 리스트

	List<Lodge> selectFilterLodge(Lodge filter); // 숙소 필터 리스트

}
