package lit.dao.face;

import lit.dto.Member;

public interface LoginDao {

	public int checkMembership(Member member);

	public Member getMember(Member member);

	public int findId(Member member);

	public Member getId(Member member);

	public int checkEmail(Member member);

}
