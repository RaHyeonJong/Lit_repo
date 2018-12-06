package lit.dto;

import java.util.Date;

public class Message {
	private int message_no;
	private int sender_no;
	private int receiver_no;
	private String contents;
	private Date send_time;
	
	@Override
	public String toString() {
		return "Message [message_no=" + message_no + ", sender_no=" + sender_no + ", receiver_no=" + receiver_no
				+ ", contents=" + contents + ", send_time=" + send_time + "]";
	}

	public int getMessage_no() {
		return message_no;
	}

	public void setMessage_no(int message_no) {
		this.message_no = message_no;
	}

	public int getSender_no() {
		return sender_no;
	}

	public void setSender_no(int sender_no) {
		this.sender_no = sender_no;
	}

	public int getReceiver_no() {
		return receiver_no;
	}

	public void setReceiver_no(int receiver_no) {
		this.receiver_no = receiver_no;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getSend_time() {
		return send_time;
	}

	public void setSend_time(Date send_time) {
		this.send_time = send_time;
	}
	
	
}
