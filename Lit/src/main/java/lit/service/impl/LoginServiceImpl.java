package lit.service.impl;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import lit.dao.face.LoginDao;
import lit.dto.Member;
import lit.service.face.LoginService;

@Service
public class LoginServiceImpl implements LoginService{
	
	@Autowired LoginDao loginDao;
	@Autowired JavaMailSenderImpl mailSender;

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

	@Override
	public boolean checkEmail(Member member) {
		int cntId = loginDao.checkEmail(member);
		
		if(cntId == 1) {
			return true;
		}
		
		return false;
	}

	@Override
	public void sendMail(Member member) {
		String from = "LifeIsTrip@lit.com";
		String to = member.getMem_id();
		String title = "[Life Is Trip] 비밀번호 재설정 메일입니다.";
		String content = "비밀번호 재설정 링크 주소?mem_id="+member.getMem_id();
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		 
			messageHelper.setFrom(from);  // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(to);     // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content);  // 메일 내용
		     
			mailSender.send(message);
		} catch(Exception e){
			System.out.println(e);
		}

	}
	

}
