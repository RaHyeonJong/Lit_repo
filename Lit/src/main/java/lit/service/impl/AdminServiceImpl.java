package lit.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lit.dao.face.AdminDao;
import lit.dto.Board;
import lit.dto.Comment;
import lit.dto.Festival;
import lit.dto.Image;
import lit.dto.Lodge;
import lit.dto.Member;
import lit.dto.Pay;
import lit.dto.Report;
import lit.service.face.AdminService;
import lit.util.Paging;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired AdminDao adminDao;
	
	// --------------------- 회원관리 ---------------------

	@Override
	public List<Member> memberList(Paging paging) { // 멤버 리스트 보이기
		
		return adminDao.memberSelectAll(paging);
	}

	@Override
	public int getTotalUserCount() { // 일반 멤버 총 수 보이기
		
		return adminDao.userSelectCntAll();
	}
	
	@Override
	public int getTotalHostCount() { // 호스트 총 수 보이기

		return adminDao.hostSelectCntAll();
	}


	@Override
	public Paging getMemberPaging(int curPage, int listCount, int pageCount, int mem_case_no) {
		
		// 멤버 페이징 정보 만들기
		int totalMemberCount = 0;
		
		if(mem_case_no == 1) {
			
			totalMemberCount = this.getTotalUserCount();
			
		}else if (mem_case_no == 2) {
			
			totalMemberCount = this.getTotalHostCount();
		}
		
		Paging paging = new Paging(totalMemberCount, curPage, listCount, pageCount);
		
		return paging;
	}

	@Override
	public Member viewMember(int mem_no) { // 멤버 상세 정보 보이기
		
		return adminDao.selectMemberByMemberno(mem_no);
	}

	// --------------------- 숙소관리 ---------------------
	
	@Override
	public List<Lodge> getLudgeList(Paging paging) { // 숙소 리스트 보이기
		
		return adminDao.lodgeSelectAll(paging);
	}

	@Override
	public int getLudgeActivation0Count() { // 비활성화 숙소 총 수 구하기
		
		return adminDao.lodgeActivation0CntAll();
	}
	
	@Override
	public int getLudgeActivation1Count() { // 활성화 숙소 총 수 구하기
		
		return adminDao.lodgeActivation1CntAll();
	}

	@Override
	public Paging getLodgePaging(int curPage, int listCount, int pageCount, int lodge_activation) {
		
		// 숙소 페이징 정보 만들기
		int totalLodgeActivationCount = 0; 
		
		if (lodge_activation == 0) {
			
			totalLodgeActivationCount = this.getLudgeActivation0Count();
		} else if (lodge_activation == 1 ) {
			
			totalLodgeActivationCount = this.getLudgeActivation1Count();
		}
		
		Paging paging = new Paging(totalLodgeActivationCount, curPage, listCount, pageCount);
		
		return paging;
	}

	@Override
	public void lodgeActivaiton(int lodge_no) { // 숙소 비활성화 시키기
		
	  adminDao.updateLodgeActivate(lodge_no);
	}



	// -------------------- 고객 센터 관리 --------------------
	
	@Override
	public List<Board> csList(Paging paging) { // 고객센터 전체 리스트 뽑기
		
		return adminDao.csSelectAll(paging);
	}

	@Override
	public int getTotalAnswer1Count() { // 답변 달린 고객문의 수 조회
		
		return adminDao.answer1CntAll();
	}
	
	@Override
	public int getTotalAnser0Count() { // 답변 안 달린 고객문의 수 조회
		
		return adminDao.answer0CntAll();
	}

	@Override
	public Paging getCsPaging(int curPage, int listCount, int pageCount, int answer) {
		
		// 페이징 처리
        int totalAnswerCount = 0;
        
        if(answer == 0) {
       
        	totalAnswerCount = this.getTotalAnser0Count();
        	
        }else if( answer ==1 ) {
        	
        	totalAnswerCount =  this.getTotalAnswer1Count();
        	
        }
		Paging paging = new Paging(totalAnswerCount,curPage,listCount,pageCount);
		
		return paging;
	}


	// -------------------- 축제 관리 --------------------

	@Override
	public List<Festival> festivalList(Paging paging) { // 이벤트 리스트
		
		return adminDao.festivalSelectAll(paging);
	}

	@Override
	public int getTotalFestivalCount() { // 총 이벤트 수 
		
		return adminDao.festivalSelectCntAll();
	}

	@Override
	public Paging getFestivalPaging(int curPage, int listCount, int pageCount) {
		
		// 페이징 처리
        int totalCount = this.getTotalFestivalCount();
		
		Paging paging = new Paging(totalCount,curPage,listCount,pageCount);
		
		return paging;
	}

	@Override
	public void writeFestival(Festival festival) { // 축제 글쓰기
		
		adminDao.insertFestival(festival);		
	}

	
	// 축제 썸네일 업로드 
	@Override
	public void uploadThumbNail(ServletContext context, MultipartFile multipartFile, Image image) {
		
		if(!"".equals(multipartFile.getOriginalFilename())) {
			
			String uId = UUID.randomUUID().toString();
			String stored = context.getRealPath("resources/images/festival");
			String name = multipartFile.getOriginalFilename() + "_" + uId;
			
			File dest = new File(stored, name);
			
			try {
				multipartFile.transferTo(dest);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			image.setOrigin_name(multipartFile.getOriginalFilename());
			image.setStored_name(dest.getName());
		    	
		}
		 adminDao.insertFestiThumbNail(image);	
	}

	// 축제 상세 보이기 
	@Override
	public Festival viewFestival(int festival_no) {
		
		return adminDao.selectFestivalByFestivalno(festival_no);
	}

	// 축제 이미지 삭제하기 
	@Override
	public void deleteFestivalImage(Image image) {
		
		adminDao.deleteFestivalImage(image);
	}

	
	// 축제 삭제하기
	@Override
	public void deleteFestival(Festival festival) {
		
		adminDao.deleteFestival(festival);
	}
	
	// -------------------- 결제 관리 --------------------
	
	// 결제 리스트 보이기
	@Override
	public List<Pay> payList(Paging paging) {
		
		return adminDao.paySelectAll(paging);
	}

	// 정상 결제 수 가져오기
	@Override
	public int getTotalPayCount() {
		
		return adminDao.paySelectCntAll();
	}

	@Override
	public int getTotalRefundCount() {
		
		return adminDao.refundSelectCntAll();
	}

	@Override
	public int getTotalRefundFinishCount() {
		
		return adminDao.refundFinishSelectCntAll();
	}

	// 결제 페이징 처리하기
	@Override
	public Paging getPayPaging(int curPage, int listCount, int pageCount, int pay_state_no) {
		
       int payTotalCount = 0;
       
       if(pay_state_no == 2 ) {
    	   
    	   payTotalCount = this.getTotalRefundCount();
    	   
       } else if (pay_state_no == 1 ) {
    	   
    	   payTotalCount = this.getTotalPayCount();
       
       } else if (pay_state_no == 3 ) {
    	  
    	   payTotalCount = this.getTotalRefundFinishCount();
       } 
       
		Paging paging = new Paging(payTotalCount,curPage,listCount,pageCount);
		
		return paging;
	}
	
	// 환불 승인하기
	@Override
	public void approveRefund(int pay_no) {
		
		adminDao.updateRefund(pay_no);
	}
	
	// -------------------- 신고 관리 --------------------
	
	// 신고당한 멤버 리스트
	@Override
	public List<Report> memberReportList(Paging paging) {

		return adminDao.reportMemberSelectAll(paging);
	}
	
	// 신고당한 멤버 수
	@Override
	public int getTotalReportMemberCount() {
		
		return adminDao.reportMemberSelectCntAll();
	}

    // 신고당한 멤버 페이징 처리
	@Override
	public Paging getReportMemberPaging(int curPage, int listCount, int pageCount) {
		
		int totalCount = this.getTotalReportMemberCount();
		
		Paging paging = new Paging(totalCount, curPage, listCount, pageCount);
		
		return paging;
	}

	// 신고당한 멤버 비활성화 
	@Override
	public void MemberDisable(int mem_no) {
		
		adminDao.updateMemberActivation(mem_no);
	}

	// 체크박스로 선택된 멤버 비활성화
	@Override
	public void checkMemberDisable(String names) {
		
		adminDao.updateCheckMemberDisable(names);
	}
	
	// 숙소 신고 리스트 보이기 
	@Override
	public List<Report> lodgeReportList(Paging paging) {
	
		return adminDao.reportLodgeSelectAll(paging);
	}

	// 숙소 신고 수 카운트
	@Override
	public int getTotalReportLodgeCount() {

		return adminDao.reportLodgeSelectCntAll();
	}

	// 신고 숙소 페이징 처리 
	@Override
	public Paging getReportLodgePaging(int curPage, int listCount, int pageCount) {
		
		int totalCount = this.getTotalReportLodgeCount();
		
		Paging paging = new Paging(totalCount, curPage, listCount, pageCount);
		
		return paging;
	}

	// 숙소 비활성화 하기 
	@Override
	public void LodgeDisable(int lodge_no) {
		
		adminDao.updateReportLodgeActivation(lodge_no);
	}

	// 체크박스로 선택된 숙소 비활성화 하기 
	@Override
	public void checkLodgeDisable(String names) {
		
		adminDao.updateCheckLodgeDisable(names);
	}
		
	// 신고 댓글 리스트
	@Override
	public List<Report> commentReportList(Paging paging) {
		
		return adminDao.reportCommentSelectAll(paging);
	}

	// 신고 댓글 수 
	@Override
	public int getTotalReportCommentCount() {

		return adminDao.reportCommentSelectCntAll();
	}

	// 신고 댓글 페이징 처리
	@Override
	public Paging getReportCcommentPaging(int curPaging, int listCount, int pageCount) {
		
		int totalCount = this.getTotalReportCommentCount();
		
		Paging paging = new Paging(totalCount, curPaging, listCount, pageCount);
		
		return paging;
	}

	// 신고 댓글 삭제하기
	@Override
	public void deleteReportComment(int comment_no) {
		
		adminDao.deleteReportComment(comment_no);
	}

	@Override
	public List<Festival> viewRecommend() {
		
		return adminDao.viewRecommend();
	}











	
	
}
