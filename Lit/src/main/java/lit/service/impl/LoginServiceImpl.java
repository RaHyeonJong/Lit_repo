package lit.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lit.dao.face.LoginDao;
import lit.dto.Member;
import lit.service.face.LoginService;

@Service
public class LoginServiceImpl implements LoginService{
	
	@Autowired LoginDao loginDao;

	@Override
	public boolean checkMembership(Member member) {
		int cntAccount = loginDao.checkMembership(member);
		
		if(cntAccount == 1) {
			return true;
		}
		
		return false;
	}

	@Override
	public Member getMember(Member member) {	
		
		return loginDao.getMember(member);
	}

	@Override
	public boolean findId(Member member) {
		int cntId = loginDao.findId(member);
		
		if(cntId == 1) {
			return true;
		}
		
		return false;
	}

	@Override
	public Member getId(Member member) {

		return loginDao.getId(member);
	}
	

}
