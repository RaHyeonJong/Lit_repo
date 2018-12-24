package lit.service.face;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;

import lit.dto.Comment;
import lit.dto.Member;

public interface MypageService {

	public void updateProfile(ServletContext context, MultipartFile multipartFile, Member mem);

	public Member getMemberByNo(Member mem);

	public List<Comment> getCommentList(Comment comm);

}
