package lit.dto;

import java.util.Date;

public class Lodge {
	private final String APARTMENT = "apartment";							//건물유형: 아파트 / building_case_no: 1
	private final String DETACHED_HOUSE = "detached_house";		//건물유형: 단독주택 / building_case_no: 2
	private final String TOWN_HOUSE = "town_house";					//건물유형: 연립주택 / building_case_no: 3
	
	private final String PENSION = "pension";					//숙소유형: 펜션(집 전체단위로 대여) / lodge_case_no: 1
	private final String MOTEL = "motel";							//숙소유형: 모텔(방 단위로 대여) / lodge_case_no: 2
	private final String GUESTHOUSE = "guesthouse";		//숙소유형: 게스트하우스(침대 단위로 대여) / lodge_case_no: 3
	
	private int lodge_no;
	private int building_case_no;		//1=APARTMENT, 2=DETACHED_HOUSE, 3=TOWN_HOUSE
	private String building_case;		// apartment or detached_house or town_house
	private int lodge_case_no;			//1=PENSION, 2=MOTEL, 3=GUESTHOUSE
	private String lodge_case;			// pension or motel or guesthouse
	private String lodge_name;
	private int lodge_capacity;		//수용인원
	private int lodge_room;			//방 개수
	private String lodge_addr;		
	private String convenient_facility;	//편의시설
	private String convenient_area;		//편의공간
	private int ready_time;			//필요한 준비시간(일수)
	private String check_in_time;		//체크인 가능시간 ex)10:00 ~ 20:00
	private int available_term;		//예약가능기간(개월수)
	private int stay_cost;		//숙박단가(원)
	private Date regit_date;		//숙소등록일
	private int lodge_activation;	//숙소활성여부. 0=비활성화, 1=활성화
	private double latitude; //위도
	private double longitude; //경도
	private int mem_no;

	@Override
	public String toString() {
		return "Lodge [APARTMENT=" + APARTMENT + ", DETACHED_HOUSE=" + DETACHED_HOUSE + ", TOWN_HOUSE=" + TOWN_HOUSE
				+ ", PENSION=" + PENSION + ", MOTEL=" + MOTEL + ", GUESTHOUSE=" + GUESTHOUSE + ", lodge_no=" + lodge_no
				+ ", building_case_no=" + building_case_no + ", building_case=" + building_case + ", lodge_case_no="
				+ lodge_case_no + ", lodge_case=" + lodge_case + ", lodge_name=" + lodge_name + ", lodge_capacity="
				+ lodge_capacity + ", lodge_room=" + lodge_room + ", lodge_addr=" + lodge_addr
				+ ", convenient_facility=" + convenient_facility + ", convenient_area=" + convenient_area
				+ ", ready_time=" + ready_time + ", check_in_time=" + check_in_time + ", available_term="
				+ available_term + ", stay_cost=" + stay_cost + ", regit_date=" + regit_date + ", lodge_activation="
				+ lodge_activation + ", latitude=" + latitude + ", longitude=" + longitude + "]";
	}

	


	public int getMem_no() {
		return mem_no;
	}


	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}


	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}




	public int getLodge_no() {
		return lodge_no;
	}

	public void setLodge_no(int lodge_no) {
		this.lodge_no = lodge_no;
	}

	public int getBuilding_case_no() {
		return building_case_no;
	}

	public void setBuilding_case_no(int building_case_no) {
		this.building_case_no = building_case_no;
		if(building_case_no == 1)
			setBuilding_case(APARTMENT);
		else if(building_case_no == 2)
			setBuilding_case(DETACHED_HOUSE);
		else if(building_case_no == 3)
			setBuilding_case(TOWN_HOUSE);
	}

	public String getBuilding_case() {
		return building_case;
	}

	public void setBuilding_case(String building_case) {
		this.building_case = building_case;
	}

	public int getLodge_case_no() {
		return lodge_case_no;
	}

	public void setLodge_case_no(int lodge_case_no) {
		this.lodge_case_no = lodge_case_no;
		if(lodge_case_no == 1)
			setLodge_case(PENSION);
		else if(lodge_case_no == 2)
			setLodge_case(MOTEL);
		else if(lodge_case_no == 3)
			setLodge_case(GUESTHOUSE);
	}

	public String getLodge_case() {
		return lodge_case;
	}

	public void setLodge_case(String lodge_case) {
		this.lodge_case = lodge_case;
	}

	public String getLodge_name() {
		return lodge_name;
	}

	public void setLodge_name(String lodge_name) {
		this.lodge_name = lodge_name;
	}

	public int getLodge_capacity() {
		return lodge_capacity;
	}

	public void setLodge_capacity(int lodge_capacity) {
		this.lodge_capacity = lodge_capacity;
	}

	public int getLodge_room() {
		return lodge_room;
	}

	public void setLodge_room(int lodge_room) {
		this.lodge_room = lodge_room;
	}

	public String getLodge_addr() {
		return lodge_addr;
	}

	public void setLodge_addr(String lodge_addr) {
		this.lodge_addr = lodge_addr;
	}

	public String getConvenient_facility() {
		return convenient_facility;
	}

	public void setConvenient_facility(String convenient_facility) {
		this.convenient_facility = convenient_facility;
	}

	public String getConvenient_area() {
		return convenient_area;
	}

	public void setConvenient_area(String convenient_area) {
		this.convenient_area = convenient_area;
	}

	public int getReady_time() {
		return ready_time;
	}

	public void setReady_time(int ready_time) {
		this.ready_time = ready_time;
	}

	public String getCheck_in_time() {
		return check_in_time;
	}

	public void setCheck_in_time(String check_in_time) {
		this.check_in_time = check_in_time;
	}

	public int getAvailable_term() {
		return available_term;
	}

	public void setAvailable_term(int available_term) {
		this.available_term = available_term;
	}

	public int getStay_cost() {
		return stay_cost;
	}

	public void setStay_cost(int stay_cost) {
		this.stay_cost = stay_cost;
	}

	public Date getRegit_date() {
		return regit_date;
	}

	public void setRegit_date(Date regit_date) {
		this.regit_date = regit_date;
	}

	public int getLodge_activation() {
		return lodge_activation;
	}

	public void setLodge_activation(int lodge_activation) {
		this.lodge_activation = lodge_activation;
	}
	
	
}
