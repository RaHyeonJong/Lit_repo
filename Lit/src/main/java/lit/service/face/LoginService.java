package lit.service.face;


import lit.dto.Member;


public interface LoginService {

	public boolean checkMembership(Member member);

	public Member getMember(Member member);

	public boolean findId(Member member);

	public Member getId(Member member);

	public boolean checkEmail(Member member);

	public void sendMail(Member member);


}
