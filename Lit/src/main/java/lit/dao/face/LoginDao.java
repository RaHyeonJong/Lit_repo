package lit.dao.face;

import lit.dto.Member;

public interface LoginDao {

	public int checkMembership(Member member);

	public Member getMember(Member member);

	public int checkEmail(Member member);

	public void updateUkey(Member member);

	public String getUkey(Member member);

	public void updatePw(Member member);

}
