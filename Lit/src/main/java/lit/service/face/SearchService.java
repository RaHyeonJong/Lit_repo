package lit.service.face;

import java.util.List;

import lit.dto.Board;
import lit.dto.Lodge;

public interface SearchService {

	List<Lodge> getLocalLodgeList(String location); // 지역 숙소 검색 리스트

	List<Board> getLocalFestivalList(String location); // 지역 행사 검색 리스트

	List<Lodge> getFilterLodgeList(Lodge filter); // 숙소 필터 리스트

}
