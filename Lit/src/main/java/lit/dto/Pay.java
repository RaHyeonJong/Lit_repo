package lit.dto;

import java.util.Date;

public class Pay {
	private final String CARD = "카드";			//寃곗젣�닔�떒: 移대뱶 / pay_method_no: 1
	private final String PHONE = "휴대폰";		//寃곗젣�닔�떒: �쑕���룿 / pay_mehtod_no: 2
	
	private final String NOMAL = "정상결제";
	private final String REFUND_WAITING = "결제 취소 요청";
	private final String REFUND_COMPLETE = "결제 취소 완료";
	
	private int pay_no;				// 寃곗젣踰덊샇
	private int mem_no;				// 援щℓ�쉶�썝踰덊샇
	private int lodge_no;				// �삁�빟�닕�냼踰덊샇
	private String lodge_name;	// �닕�냼�씠由�
	private int room_no;				// �삁�빟諛⑸쾲�샇(�닕�냼�쑀�삎�씠 motel�뿉 �빐�떦�릺�뒗 寃쎌슦�뿉留�)
	private int pay_method_no;	// 1=CARD, 2=PHONE
	private String pay_method;	// card or phone
	private int pay_sum;				// 寃곗젣珥앺빀
	private int cleaning_cost;		// 泥��냼鍮�
	private int service_fee;			// �꽌鍮꾩뒪 �닔�닔猷�
	private int stay_term;			// �닕諛뺤씪�닔
	private Date pay_time;			// 寃곗젣�씪�떆
	private Date stay_start;		// �닕諛뺤떆�옉�궇吏�
	private Date stay_end;			// �닕諛뺤쥌猷뚮궇吏�
	private int stay_heads;			// �닕諛뺤씤�썝
	private int pay_state_no;			// 寃곗젣�긽�깭 / NOMAL: �젙�긽, REFUND_WAITING: �솚遺덈�湲�, REFUND_COMPLETE: �솚遺덉셿猷�
	private String pay_state;			// NOMAL or REFUND_WAITING or REFUND_COMPLETE
	
	private String stored_name;		// �닕�냼 �뜽�꽕�씪 �씠誘몄�
	private String payMember;
	private String lodgeName;
    private String hostName;
    
    

	
	@Override
	public String toString() {
		return "Pay [CARD=" + CARD + ", PHONE=" + PHONE + ", NOMAL=" + NOMAL + ", REFUND_WAITING=" + REFUND_WAITING
				+ ", REFUND_COMPLETE=" + REFUND_COMPLETE + ", pay_no=" + pay_no + ", mem_no=" + mem_no + ", lodge_no="
				+ lodge_no + ", lodge_name=" + lodge_name + ", room_no=" + room_no + ", pay_method_no=" + pay_method_no
				+ ", pay_method=" + pay_method + ", pay_sum=" + pay_sum + ", cleaning_cost=" + cleaning_cost
				+ ", service_fee=" + service_fee + ", stay_term=" + stay_term + ", pay_time=" + pay_time
				+ ", stay_start=" + stay_start + ", stay_end=" + stay_end + ", stay_heads=" + stay_heads
				+ ", pay_state_no=" + pay_state_no + ", pay_state=" + pay_state + ", stored_name=" + stored_name
				+ ", payMember=" + payMember + ", lodgeName=" + lodgeName + ", hostName=" + hostName + "]";
	}
	public String getPayMember() {
		return payMember;
	}
	public void setPayMember(String payMember) {
		this.payMember = payMember;
	}
	public String getLodgeName() {
		return lodgeName;
	}
	public void setLodgeName(String lodgeName) {
		this.lodgeName = lodgeName;
	}
	public String getHostName() {
		return hostName;
	}
	public void setHostName(String hostName) {
		this.hostName = hostName;
	}
	public int getPay_state_no() {
		return pay_state_no;
	}
	public void setPay_state_no(int pay_state_no) {
		this.pay_state_no = pay_state_no;
		if(pay_state_no == 1)
			setPay_state(NOMAL);
		else if(pay_state_no == 2)
			setPay_state(REFUND_WAITING);
		else if(pay_state_no == 3)
			setPay_state(REFUND_COMPLETE);			
	}
	public String getPay_state() {
		return pay_state;
	}
	public void setPay_state(String pay_state) {
		this.pay_state = pay_state;
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
	public String getLodge_name() {
		return lodge_name;
	}
	public void setLodge_name(String lodge_name) {
		this.lodge_name = lodge_name;
	}

	public String getStored_name() {
		return stored_name;
	}
	public void setStored_name(String stored_name) {
		this.stored_name = stored_name;
	}
}
