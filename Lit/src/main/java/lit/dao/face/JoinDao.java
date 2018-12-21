package lit.dao.face;

import lit.dto.Image;
import lit.dto.Member;

public interface JoinDao {

	public int checkId(Member member);

	public void insertMember(Member member);

	public void insertMyPhoto(Image image);

}
