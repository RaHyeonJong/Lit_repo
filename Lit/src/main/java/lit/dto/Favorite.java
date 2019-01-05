package lit.dto;

public class Favorite {
	private int favorite_no;
	private int mem_no;
	private int lodge_no;
	private String lodge_name;
	private String lodge_addr;
	
	public int getFavorite_no() {
		return favorite_no;
	}

	public void setFavorite_no(int favorite_no) {
		this.favorite_no = favorite_no;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public int getLodge_no() {
		return lodge_no;
	}

	public void setLodge_no(int lodge_no) {
		this.lodge_no = lodge_no;
	}

	@Override
	public String toString() {
		return "Favorite [favorite_no=" + favorite_no + ", mem_no=" + mem_no + ", lodge_no=" + lodge_no
				+ ", lodge_name=" + lodge_name + "]";
	}

	public String getLodge_name() {
		return lodge_name;
	}

	public void setLodge_name(String lodge_name) {
		this.lodge_name = lodge_name;
	}

	public String getLodge_addr() {
		return lodge_addr;
	}

	public void setLodge_addr(String lodge_addr) {
		this.lodge_addr = lodge_addr;
	}
	
	
	
}
