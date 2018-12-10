package lit.dto;

import java.util.Date;

public class Comment {
	
	private int comment_no;
	private int parent_comment_no;
	private int board_no;
	private int lodge_no;
	private String contents;
	private int mem_no;
	private String mem_name;
	private Date written_time;

	@Override
	public String toString() {
		return "Comment [comment_no=" + comment_no + ", parent_comment_no=" + parent_comment_no + ", board_no="
				+ board_no + ", lodge_no=" + lodge_no + ", contents=" + contents + ", mem_no=" + mem_no + ", mem_name="
				+ mem_name + ", written_time=" + written_time + "]";
	}

	public int getComment_no() {
		return comment_no;
	}

	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}

	public int getParent_comment_no() {
		return parent_comment_no;
	}

	public void setParent_comment_no(int parent_comment_no) {
		this.parent_comment_no = parent_comment_no;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public int getLodge_no() {
		return lodge_no;
	}

	public void setLodge_no(int lodge_no) {
		this.lodge_no = lodge_no;
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
	
	
}
