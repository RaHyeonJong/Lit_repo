package lit.dto;

import java.sql.Date;

public class Board {
	private int board_no;
	private String title;
	private String contents;
	private int mem_no;
	private Date written_time;
	private int answer;
	
	private String mem_name; //관리자 입장에서 문의사항 적은 작성자 불러오기
	private String cmt; //Comment_tb에 있는 cmt (View 항목 참고할 것)
	
	
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public Date getWritten_time() {
		return written_time;
	}
	public void setWritten_time(Date written_time) {
		this.written_time = written_time;
	}
	public int getAnswer() {
		return answer;
	}
	public void setAnswer(int answer) {
		this.answer = answer;
	}
	public String getCmt() {
		return cmt;
	}
	public void setCmt(String cmt) {
		this.cmt = cmt;
	}
	@Override
	public String toString() {
		return "Board [board_no=" + board_no + ", title=" + title + ", contents=" + contents + ", mem_no=" + mem_no
				+ ", mem_name=" + mem_name + ", written_time=" + written_time + ", answer=" + answer + ", cmt=" + cmt
				+ "]";
	}
	
	
		
}