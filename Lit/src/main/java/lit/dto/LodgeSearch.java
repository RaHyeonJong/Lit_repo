package lit.dto;

import java.sql.Date;

public class LodgeSearch {
	private String location;
	private Date startDate;
	private Date endDate;
	private int capacity;

	@Override
	public String toString() {
		return "LodgeSearch [location=" + location + ", startDate=" + startDate + ", endDate=" + endDate + ", capacity="
				+ capacity + "]";
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

}
