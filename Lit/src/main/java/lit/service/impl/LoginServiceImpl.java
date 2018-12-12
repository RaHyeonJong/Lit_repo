package lit.service.impl;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
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
		String title = "[LIFE IS TRIP] 비밀번호 재설정 링크메일 입니다.";
		String content = "<div style=\"width:600px; height:600px;\">\r\n" + 
				"<table style=\"width:100%;\">\r\n" + 
				"<tr><td style=\"font-size:40px; font-weight: bold;\">\r\n" + 
				"<img style=\"height: 38px;\" \r\n" + 
				"	src=\"https://mblogthumb-phinf.pstatic.net/20120807_173/wldnjs980227_1344341038774YQ23Y_JPEG/%B9%D0%C2%A4%B8%F0%C0%DA_%C7%D8%C0%FB%B4%DC.jpg?type=w2\"/>\r\n" + 
				"LIFE IS TRIP</td></tr>\r\n" + 
				"<tr><td style=\"padding-top:15px; font-size:18px;\">"+ member.getMem_name() +" 님, 안녕하세요.</td></tr>\r\n" + 
				"<tr><td style=\"padding-top:15px; font-size:18px;\">비밀번호 재설정을 요청하셨습니다.</td></tr>\r\n" + 
				"<tr><td style=\"padding-top:15px; font-size:18px;\">회원님이 요청하지 않은 경우 아무런 조치를 취하실 필요가 없습니다.<br>\r\n" + 
				"요청하셨다면 다음 링크를 이용해 비밀번호를 재설정하세요.</td></tr>\r\n" + 
				"<tr><td style=\"padding-top:30px;\">\r\n" + 
				"<a style=\"text-decoration:none;\" href=\"localhost:8585/login/changePw?mem_id="+ member.getMem_id() +"\">\r\n" + 
				"<div style=\"display:table; width:200px; height:50px; text-align:center; background-color:#FF5A5F; border-radius:3px;\">\r\n" + 
				"<div style=\"display:table-cell; vertical-align:middle; color:white; font-size: 18px; cursor:pointer;\">비밀번호 재설정하기</div>\r\n" + 
				"</div></a>\r\n" + 
				"</td></tr>\r\n" + 
				"<tr><td style=\"padding-top:15px; font-size:18px;\">감사합니다.</td></tr>\r\n" + 
				"<tr><td style=\"padding-top:5px; font-size:18px;\">라이프이즈트립 팀 드림</td></tr>\r\n" + 
				"</table>\r\n" + 
				"</div>";
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
		 
			message.setFrom(new InternetAddress(from));  // 보내는사람 생략하거나 하면 정상작동을 안함
			message.addRecipient(RecipientType.TO, new InternetAddress(to));     // 받는사람 이메일
			message.setSubject(title); // 메일제목은 생략이 가능하다
			message.setText(content, "UTF-8", "html");  // 메일 내용
		     
			mailSender.send(message);
		} catch(Exception e){
			System.out.println(e);
		}

	}
	

}
