package lit.dto;

public class Report {
	private int report_no;	//신고번호
	private int reporter_no;		//신고자
	private int board_no;		//악성게시글
	private int comment_no;	//악성댓글
	private int lodge_no;		//불량숙소
	private int mem_no;		//불량회원
	
	
	
	
	public int getReport_no() {
		return report_no;
	}
	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}
	public int getReporter_no() {
		return reporter_no;
	}
	public void setReporter_no(int reporter_no) {
		this.reporter_no = reporter_no;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	public int getLodge_no() {
		return lodge_no;
	}
	public void setLodge_no(int lodge_no) {
		this.lodge_no = lodge_no;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	@Override
	public String toString() {
		return "Report [report_no=" + report_no + ", reporter_no=" + reporter_no + ", board_no=" + board_no
				+ ", comment_no=" + comment_no + ", lodge_no=" + lodge_no + ", mem_no=" + mem_no + "]";
	}
	

	
	
}
