package lit.dto;

public class Room {
	private int room_no;
	private int lodge_no;
	private String room_name;
	private int room_capacity;
	
	@Override
	public String toString() {
		return "Room [room_no=" + room_no + ", lodge_no=" + lodge_no + ", room_name=" + room_name + ", room_capacity="
				+ room_capacity + "]";
	}

	public int getRoom_no() {
		return room_no;
	}

	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}

	public int getLodge_no() {
		return lodge_no;
	}

	public void setLodge_no(int lodge_no) {
		this.lodge_no = lodge_no;
	}

	public String getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}

	public int getRoom_capacity() {
		return room_capacity;
	}

	public void setRoom_capacity(int room_capacity) {
		this.room_capacity = room_capacity;
	}

	
	
}
