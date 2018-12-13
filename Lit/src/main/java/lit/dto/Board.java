package lit.dto;

import java.util.Date;

<<<<<<< HEAD
public class Board {
=======
public class Board {	
>>>>>>> branch 'master' of https://github.com/RaHyeonJong/Lit_repo.git
	private int board_no;
	private String title;
	private String contents;
	private int mem_no;
	private String mem_name;
	private Date written_time;
	private int hit;
	@Override
	public String toString() {
<<<<<<< HEAD
		return "Board [board_no=" + board_no + ", title=" + title + ", contents=" + contents + ", mem_no=" + mem_no
				+ ", mem_name=" + mem_name + ", written_time=" + written_time + ", hit=" + hit + "]";
=======
		return "Board [board_no=" + board_no + ", title=" + title + ", contents="
				+ contents + ", mem_no=" + mem_no + ", written_time=" + written_time + ", hit=" + hit + "]";
>>>>>>> branch 'master' of https://github.com/RaHyeonJong/Lit_repo.git
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
<<<<<<< HEAD
=======

>>>>>>> branch 'master' of https://github.com/RaHyeonJong/Lit_repo.git
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
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}

<<<<<<< HEAD
=======
	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	
	
>>>>>>> branch 'master' of https://github.com/RaHyeonJong/Lit_repo.git
}
