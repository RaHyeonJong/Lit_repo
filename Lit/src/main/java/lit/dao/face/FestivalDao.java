package lit.dao.face;

import lit.dto.Festival;


public interface FestivalDao {
		
	// 행사 정보 상세조회 반환
	public Festival selectFestivalByFestivalno(int festival_no);
	
	

}
