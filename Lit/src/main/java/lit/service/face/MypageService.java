package lit.service.face;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;

import lit.dto.Comment;
import lit.dto.Favorite;
import lit.dto.Lodge;
import lit.dto.Member;
import lit.dto.Pay;
import lit.dto.Report;
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

	public void cancelPayment(Pay pay);

	public Pay getPay(Pay pay);

	public Lodge getLodge(Pay pay);

	public Member getHost(Lodge lodge);

	public void deleteMember(Member mem);

	public boolean checkReport(Report report);

	public void reportMember(Report report);

}
