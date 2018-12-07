package lit.service.face;

import java.util.List;

import lit.dto.Comment;
import lit.dto.Lodge;
import lit.dto.LodgeSearch;

public interface LogoService {

	List<Lodge> getLodgeList(LodgeSearch search); // 숙소 검색 결과

	List<String> getLocationAjaxList(String location); // 검색시 지역 검색어 추천 보여주는 ajax 리스트

	List<Comment> getReviewList(); // 숙소 후기 리스트

}
