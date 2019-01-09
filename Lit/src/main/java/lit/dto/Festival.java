package lit.dto;

import java.util.Date;

public class Festival {
	private int festival_no;			//축제번호
	private String festival_name;		//축제이름
	private String festival_contents;	//축제내용
	private String festival_term;		//축제기간
	private Date written_time;			//작성시간
	private int hit;					//조회수
	private String origin_name;			//썸네일 이미지파일 원본이름
	private String stored_name;			//썸네일 이미지파일 저장이름
	private Date start_date;
	private Date end_date;
	
	@Override
	public String toString() {
		return "Festival [festival_no=" + festival_no + ", festival_name=" + festival_name + ", festival_contents="
				+ festival_contents + ", festival_term=" + festival_term + ", written_time=" + written_time + ", hit="
				+ hit + ", origin_name=" + origin_name + ", stored_name=" + stored_name + "]";
	}
	

	public int getFestival_no() {
		return festival_no;
	}

	public Date getStart_date() {
		return start_date;
	}


	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}


	public Date getEnd_date() {
		return end_date;
	}


	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}


	public void setFestival_no(int festival_no) {
		this.festival_no = festival_no;
	}

	public String getFestival_name() {
		return festival_name;
	}

	public void setFestival_name(String festival_name) {
		this.festival_name = festival_name;
	}

	public String getFestival_contents() {
		return festival_contents;
	}

	public void setFestival_contents(String festival_contents) {
		this.festival_contents = festival_contents;
	}

	public String getFestival_term() {
		return festival_term;
	}

	public void setFestival_term(String festival_term) {
		this.festival_term = festival_term;
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

	public String getOrigin_name() {
		return origin_name;
	}

	public void setOrigin_name(String origin_name) {
		this.origin_name = origin_name;
	}

	public String getStored_name() {
		return stored_name;
	}

	public void setStored_name(String stored_name) {
		this.stored_name = stored_name;
	}
}
