package kh.com.semi.dto;

import java.sql.Date;

public class MemberDTO {
	private String id;
	private String password;
	private String name;
	private String nickname;
	private String phone;
	private String email;
	private int postcode;
	private String detailAddr;
	private String roadAddr;
	private String extraAddr;
	private String member_category;
	private String business_no;
	private int center_seq;
	private Date signup_date;

	
	public MemberDTO() {}


	public MemberDTO(String id, String password, String name, String nickname, String phone, String email, int postcode,
			String detailAddr, String roadAddr, String extraAddr, String member_category, String business_no,
			int center_seq, Date signup_date) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.nickname = nickname;
		this.phone = phone;
		this.email = email;
		this.postcode = postcode;
		this.detailAddr = detailAddr;
		this.roadAddr = roadAddr;
		this.extraAddr = extraAddr;
		this.member_category = member_category;
		this.business_no = business_no;
		this.center_seq = center_seq;
		this.signup_date = signup_date;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public int getPostcode() {
		return postcode;
	}


	public void setPostcode(int postcode) {
		this.postcode = postcode;
	}


	public String getDetailAddr() {
		return detailAddr;
	}


	public void setDetailAddr(String detailAddr) {
		this.detailAddr = detailAddr;
	}


	public String getRoadAddr() {
		return roadAddr;
	}


	public void setRoadAddr(String roadAddr) {
		this.roadAddr = roadAddr;
	}


	public String getExtraAddr() {
		return extraAddr;
	}


	public void setExtraAddr(String extraAddr) {
		this.extraAddr = extraAddr;
	}


	public String getMember_category() {
		return member_category;
	}


	public void setMember_category(String member_category) {
		this.member_category = member_category;
	}


	public String getBusiness_no() {
		return business_no;
	}


	public void setBusiness_no(String business_no) {
		this.business_no = business_no;
	}


	public int getCenter_seq() {
		return center_seq;
	}


	public void setCenter_seq(int center_seq) {
		this.center_seq = center_seq;
	}


	public Date getSignup_date() {
		return signup_date;
	}


	public void setSignup_date(Date signup_date) {
		this.signup_date = signup_date;
	}

}
