package lit.dto;

// 맵 동서남북 좌표
public class MapBounds {
	private String neLat;
	private String neLng;
	private String swLat;
	private String swLng;
	
	private double neLat2;
	private double neLng2;
	private double swLat2;
	private double swLng2;
	
	public String getNeLat() {
		return neLat;
	}
	public void setNeLat(String neLat) {
		this.neLat = neLat;
	}
	public String getNeLng() {
		return neLng;
	}
	public void setNeLng(String neLng) {
		this.neLng = neLng;
	}
	public String getSwLat() {
		return swLat;
	}
	public void setSwLat(String swLat) {
		this.swLat = swLat;
	}
	public String getSwLng() {
		return swLng;
	}
	public void setSwLng(String swLng) {
		this.swLng = swLng;
	}
	public double getNeLat2() {
		return neLat2;
	}
	public void setNeLat2(double neLat2) {
		this.neLat2 = neLat2;
	}
	public double getNeLng2() {
		return neLng2;
	}
	public void setNeLng2(double neLng2) {
		this.neLng2 = neLng2;
	}
	public double getSwLat2() {
		return swLat2;
	}
	public void setSwLat2(double swLat2) {
		this.swLat2 = swLat2;
	}
	public double getSwLng2() {
		return swLng2;
	}
	public void setSwLng2(double swLng2) {
		this.swLng2 = swLng2;
	}
	
	@Override
	public String toString() {
		return "MapBounds [neLat=" + neLat + ", neLng=" + neLng + ", swLat=" + swLat + ", swLng=" + swLng + ", neLat2="
				+ neLat2 + ", neLng2=" + neLng2 + ", swLat2=" + swLat2 + ", swLng2=" + swLng2 + "]";
	}
	
}
