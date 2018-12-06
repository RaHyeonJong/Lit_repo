package lit.dto;

import java.util.Date;

public class Day_off {
	private int day_off_no;	//휴무번호
	private int lodge_no;		
	private Date day_off_date;	//휴무날짜
	
	@Override
	public String toString() {
		return "Day_off [day_off_no=" + day_off_no + ", lodge_no=" + lodge_no + ", day_off_date=" + day_off_date + "]";
	}

	public int getDay_off_no() {
		return day_off_no;
	}

	public void setDay_off_no(int day_off_no) {
		this.day_off_no = day_off_no;
	}

	public int getLodge_no() {
		return lodge_no;
	}

	public void setLodge_no(int lodge_no) {
		this.lodge_no = lodge_no;
	}

	public Date getDay_off_date() {
		return day_off_date;
	}

	public void setDay_off_date(Date day_off_date) {
		this.day_off_date = day_off_date;
	}
	
	
}
