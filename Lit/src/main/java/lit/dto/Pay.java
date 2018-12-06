package lit.dto;

import java.util.Date;

public class Pay {
	private final String CARD = "card";			//결제수단: 카드 / pay_method_no: 1
	private final String PHONE = "phone";		//결제수단: 휴대폰 / pay_mehtod_no: 2
	
	private int pay_no;				// 결제번호
	private int mem_no;				// 구매회원번호
	private int lodge_no;				// 예약숙소번호
	private int room_no;				// 예약방번호(숙소유형이 motel에 해당되는 경우에만)
	private int pay_method_no;	// 1=CARD, 2=PHONE
	private String pay_method;	// card or phone
	private int pay_sum;				// 결제총합
	private int cleaning_cost;		// 청소비
	private int service_fee;			// 서비스 수수료
	private int stay_term;			// 숙박일수
	private Date pay_time;			// 결제일시
	private Date stay_start;		// 숙박시작날짜
	private Date stay_end;			// 숙박종료날짜
	private int stay_heads;			// 숙박인원
	
	@Override
	public String toString() {
		return "Pay [pay_no=" + pay_no + ", mem_no=" + mem_no + ", lodge_no=" + lodge_no + ", room_no=" + room_no
				+ ", pay_method_no=" + pay_method_no + ", pay_method=" + pay_method + ", pay_sum=" + pay_sum
				+ ", cleaning_cost=" + cleaning_cost + ", service_fee=" + service_fee + ", stay_term=" + stay_term
				+ ", pay_time=" + pay_time + ", stay_start=" + stay_start + ", stay_end=" + stay_end + ", stay_heads="
				+ stay_heads + "]";
	}

	public int getPay_no() {
		return pay_no;
	}

	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
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

	public int getRoom_no() {
		return room_no;
	}

	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}

	public int getPay_method_no() {
		return pay_method_no;
	}

	public void setPay_method_no(int pay_method_no) {
		this.pay_method_no = pay_method_no;
		if(pay_method_no == 1)
			setPay_method(CARD);
		else if(pay_method_no == 2)
			setPay_method(PHONE);
	}

	public String getPay_method() {
		return pay_method;
	}

	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}

	public int getPay_sum() {
		return pay_sum;
	}

	public void setPay_sum(int pay_sum) {
		this.pay_sum = pay_sum;
	}

	public int getCleaning_cost() {
		return cleaning_cost;
	}

	public void setCleaning_cost(int cleaning_cost) {
		this.cleaning_cost = cleaning_cost;
	}

	public int getService_fee() {
		return service_fee;
	}

	public void setService_fee(int service_fee) {
		this.service_fee = service_fee;
	}

	public int getStay_term() {
		return stay_term;
	}

	public void setStay_term(int stay_term) {
		this.stay_term = stay_term;
	}

	public Date getPay_time() {
		return pay_time;
	}

	public void setPay_time(Date pay_time) {
		this.pay_time = pay_time;
	}

	public Date getStay_start() {
		return stay_start;
	}

	public void setStay_start(Date stay_start) {
		this.stay_start = stay_start;
	}

	public Date getStay_end() {
		return stay_end;
	}

	public void setStay_end(Date stay_end) {
		this.stay_end = stay_end;
	}

	public int getStay_heads() {
		return stay_heads;
	}

	public void setStay_heads(int stay_heads) {
		this.stay_heads = stay_heads;
	}
	
	
}
