package lit.dto;

import java.util.Date;

public class Board {
	private final String INQUIRY = "inquiry";		//게시판유형: 문의 / board_case_no: 1
	private final String EVENT = "event";			//게시판유형: 이벤트 / board_case_no: 2
	
	private int board_no;
	private int board_case_no;
	private String board_case;
	private String title;
	private String contents;
	private int mem_no;
	private String mem_name;
	private Date written_time;
	private int hit;
	
	@Override
	public String toString() {
		return "Board [board_no=" + board_no + ", board_case_no=" + board_case_no + ", title=" + title + ", contents="
				+ contents + ", mem_no=" + mem_no + ", written_time=" + written_time + ", hit=" + hit + "]";
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public int getBoard_case_no() {
		return board_case_no;
	}

	public void setBoard_case_no(int board_case_no) {
		this.board_case_no = board_case_no;
		if(board_case_no == 1)
			setBoard_case(INQUIRY);
		else if(board_case_no == 2)
			setBoard_case(EVENT);
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

	public Date getWritten_time() {
		return written_time;
	}

	public void setWritten_time(Date written_time) {
		this.written_time = written_time;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getBoard_case() {
		return board_case;
	}

	public void setBoard_case(String board_case) {
		this.board_case = board_case;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	
	
}
