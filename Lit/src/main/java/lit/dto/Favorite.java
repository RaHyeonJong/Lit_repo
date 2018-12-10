package lit.dto;

public class Favorite {
	private int favorite_no;
	private int mem_no;
	private int lodge_no;
	private String lodge_name;
	
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
	
	
	
}
