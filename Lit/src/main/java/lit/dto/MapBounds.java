package lit.dto;

// 맵 동서남북 좌표
public class MapBounds {
	private double neLat;
	private double neLng;
	private double swLat;
	private double swLng;
	
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
		return "MapBounds [neLat=" + neLat + ", neLng=" + neLng + ", swLat=" + swLat + ", swLng=" + swLng + "]";
	}
	
}
