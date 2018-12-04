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
	public boolean login(Member member) {
		
		loginDao.login(member);
		// 로그인 성공 시 1, 실패시 0 반환한다.
		
		return false;
	}

}
