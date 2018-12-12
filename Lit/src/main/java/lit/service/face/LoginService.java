package lit.service.face;


import lit.dto.Member;


public interface LoginService {

	public boolean checkMembership(Member member);

	public Member getMember(Member member);

	public boolean checkEmail(Member member);

	public void sendMail(Member member);

	public String getUkey(Member member);

	public void updatePw(Member member);


}
