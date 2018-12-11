package lit.dto;

import java.util.Date;

public class Member {
	private final String ADMIN = "admin"; 	//회원유형: 관리자 / mem_case_no = 0
	private final String USER = "user"; 	//회원유형: 일반유저 / mem_case_no = 1
	private final String HOST = "host";		//회원유형: 호스트 / mem_case_no = 2
	
	private int mem_no;
	private int mem_case_no;		// 0 = ADMIN, 1 = USER, 2 = HOST
	private String mem_case;		// ADMIN or USER or HOST
	private String mem_id;
	private String mem_pw;
	private String mem_name;
	private String mem_phone;
	private Date mem_birth;
	private String mem_myquestion;
	private String mem_myanswer;
	private String origin_name;		//프로필 사진 파일 원본이름
	private String stored_name;		//프로필 사진 파일 저장이름
	private String mem_intro;
	private int mem_activation;	// 0 = 비활성화, 1 = 활성화
	
	@Override
	public String toString() {
		return "Member [mem_no=" + mem_no + ", mem_case_no="	+ mem_case_no + ", mem_case=" + mem_case + ", mem_id=" 
				+ mem_id + ", mem_pw=" + mem_pw + ", mem_name="	+ mem_name + ", mem_phone=" + mem_phone 
				+ ", mem_birth=" + mem_birth + ", mem_myquestion=" + mem_myquestion	+ ", mem_myanswer=" 
				+ mem_myanswer + ", origin_name=" + origin_name + ", stored_name=" + stored_name
				+ ", mem_intro=" + mem_intro + ", mem_activation=" + mem_activation + "]";
	}
	
	public String getMem_myquestion() {
		return mem_myquestion;
	}

	public void setMem_myquestion(String mem_myquestion) {
		this.mem_myquestion = mem_myquestion;
	}

	public String getMem_myanswer() {
		return mem_myanswer;
	}

	public void setMem_myanswer(String mem_myanswer) {
		this.mem_myanswer = mem_myanswer;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public int getMem_case_no() {
		return mem_case_no;
	}

	public void setMem_case_no(int mem_case_no) {
		this.mem_case_no = mem_case_no;
		if(mem_case_no == 0)
			setMem_case(ADMIN);
		else if(mem_case_no == 1)
			setMem_case(USER);
		else if(mem_case_no == 2)
			setMem_case(HOST);
	}

	public String getMem_case() {
		return mem_case;
	}

	public void setMem_case(String mem_case) {
		this.mem_case = mem_case;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pw() {
		return mem_pw;
	}

	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_phone() {
		return mem_phone;
	}

	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}

	public Date getMem_birth() {
		return mem_birth;
	}

	public void setMem_birth(Date mem_birth) {
		this.mem_birth = mem_birth;
	}

	public String getOrigin_name() {
		return origin_name;
	}

	public void setOrigin_name(String origin_name) {
		this.origin_name = origin_name;
	}

	public void setStored_name(String stored_name) {
		this.stored_name = stored_name;
	}
	
	public String getStored_name() {
		return stored_name;
	}

	public String getMem_intro() {
		return mem_intro;
	}

	public void setMem_intro(String mem_intro) {
		this.mem_intro = mem_intro;
	}

	public int getMem_activation() {
		return mem_activation;
	}

	public void setMem_activation(int mem_activation) {
		this.mem_activation = mem_activation;
	}
	
	
	

}
