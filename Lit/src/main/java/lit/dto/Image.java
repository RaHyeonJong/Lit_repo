package lit.dto;

public class Image {

	private int image_no; //이미지 번호
	private String origin_name; 
	private String stored_name;
	private int lodge_no; // 숙소 번호
	private int mem_no; 
	private int board_no;
	private int thumb_nail;
    private int festival_no; // 페스티발 번호 	

	@Override
	public String toString() {
		return "Image [image_no=" + image_no + ", origin_name=" + origin_name + ", stored_name=" + stored_name
				+ ", lodge_no=" + lodge_no + ", mem_no=" + mem_no + ", board_no=" + board_no + ", thumb_nail="
				+ thumb_nail + ", festival_no=" + festival_no + "]";
	}
	public int getFestival_no() {
		return festival_no;
	}
	public void setFestival_no(int festival_no) {
		this.festival_no = festival_no;
	}
	public int getImage_no() {
		return image_no;
	}
	public void setImage_no(int image_no) {
		this.image_no = image_no;
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
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public int getThumb_nail() {
		return thumb_nail;
	}
	public void setThumb_nail(int thumb_nail) {
		this.thumb_nail = thumb_nail;
	}
	
}
