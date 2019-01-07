package lit.dto;

public class SearchFilter {
	private int peopleCnt; 	// 인원 필터
	private int minPrice;
	private int maxPrice;
	private double neLat;	
	private double neLng;
	private double swLat;
	private double swLng;
	
	public int getPeopleCnt() {
		return peopleCnt;
	}
	public void setPeopleCnt(int peopleCnt) {
		this.peopleCnt = peopleCnt;
	}
	public int getMinPrice() {
		return minPrice;
	}
	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}
	public int getMaxPrice() {
		return maxPrice;
	}
	public void setMaxPrice(int maxPrice) {
		this.maxPrice = maxPrice;
	}
	public double getNeLat() {
		return neLat;
	}
	public void setNeLat(double neLat) {
		this.neLat = neLat;
	}
	public double getNeLng() {
		return neLng;
	}
	public void setNeLng(double neLng) {
		this.neLng = neLng;
	}
	public double getSwLat() {
		return swLat;
	}
	public void setSwLat(double swLat) {
		this.swLat = swLat;
	}
	public double getSwLng() {
		return swLng;
	}
	public void setSwLng(double swLng) {
		this.swLng = swLng;
	}
	
	@Override
	public String toString() {
		return "SearchFilter [peopleCnt=" + peopleCnt + ", minPrice=" + minPrice + ", maxPrice=" + maxPrice + ", neLat="
				+ neLat + ", neLng=" + neLng + ", swLat=" + swLat + ", swLng=" + swLng + "]";
	}
	
		
	
}
