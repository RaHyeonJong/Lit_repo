package lit.service.face;

import lit.dto.Member;

public interface JoinService {

	public boolean checkId(Member member);

	public void insertMember(Member member);

}
