package lit.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lit.dao.face.JoinDao;
import lit.dto.Member;
import lit.service.face.JoinService;

@Service
public class JoinServiceImpl implements JoinService{
	
	@Autowired JoinDao joinDao;

	@Override
	public boolean checkId(Member member) {
		
		int idCnt = joinDao.checkId(member);
		if(idCnt > 0)
			return true;
		
		return false;
	}

	@Override
	public void insertMember(Member member) {
		joinDao.insertMember(member);
	}

}
