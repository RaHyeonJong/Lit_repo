package lit.dao.face;

import java.util.List;

import lit.dto.Comment;
import lit.dto.Lodge;
import lit.dto.LodgeSearch;

public interface LogoDao {

	List<Lodge> selectLodgeList(LodgeSearch search); // 숙소 검색 결과

	List<String> selectLocationAjax(String location); // 숙소 검색어 추천 리스트

	List<Comment> selectReview(); // 숙소 후기 리스트
}
