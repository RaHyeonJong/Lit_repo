package lit.service.face;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;

import lit.dto.Comment;
import lit.dto.Favorite;
import lit.dto.Member;
import lit.dto.Pay;
import lit.util.Paging;

public interface MypageService {

	public void updateProfile(ServletContext context, MultipartFile multipartFile, Member mem);

	public Member getMemberByNo(Member mem);

	public List<Comment> getCommentList(Paging paging);

	public int getTotalCommCnt(int mem_no);

	public int getTotalFavorCnt(int mem_no);

	public List<Favorite> getFavorList(Paging paging);

	public void deleteMyFavor(Favorite favor);

	public int getTotalPayCnt(int mem_no);

	public List<Pay> getPayList(Paging paging);

}
