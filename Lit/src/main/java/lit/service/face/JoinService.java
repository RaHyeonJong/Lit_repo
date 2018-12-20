package lit.service.face;

import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;

import lit.dto.Member;

public interface JoinService {

	public boolean checkId(Member member);

	public void insertMember(Member member);

	public void insertMyPhoto(ServletContext context, MultipartFile fileupload, int mem_no);

}
