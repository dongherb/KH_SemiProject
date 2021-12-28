package kh.com.semi.dto;

public class CenterDTO {
	private int center_seq;
	private String center_name;
	private int center_price; 
	private String exercise; 
	private String center_tel; 
	private int postcode; 
	private String detailAddr; 
	private String roadAddr; 
	private String extraAddr; 
	private String business_no;
	private Double lat;
	private Double lng;
	
	public CenterDTO() {}

	public CenterDTO(int center_seq, String center_name, int center_price, String exercise, String center_tel,
			int postcode, String detailAddr, String roadAddr, String extraAddr, String business_no, Double lat,
			Double lng) {
		super();
		this.center_seq = center_seq;
		this.center_name = center_name;
		this.center_price = center_price;
		this.exercise = exercise;
		this.center_tel = center_tel;
		this.postcode = postcode;
		this.detailAddr = detailAddr;
		this.roadAddr = roadAddr;
		this.extraAddr = extraAddr;
		this.business_no = business_no;
		this.lat = lat;
		this.lng = lng;
	}

	public int getCenter_seq() {
		return center_seq;
	}

	public void setCenter_seq(int center_seq) {
		this.center_seq = center_seq;
	}

	public String getCenter_name() {
		return center_name;
	}

	public void setCenter_name(String center_name) {
		this.center_name = center_name;
	}

	public int getCenter_price() {
		return center_price;
	}

	public void setCenter_price(int center_price) {
		this.center_price = center_price;
	}

	public String getExercise() {
		return exercise;
	}

	public void setExercise(String exercise) {
		this.exercise = exercise;
	}

	public String getCenter_tel() {
		return center_tel;
	}

	public void setCenter_tel(String center_tel) {
		this.center_tel = center_tel;
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

	public String getBusiness_no() {
		return business_no;
	}

	public void setBusiness_no(String business_no) {
		this.business_no = business_no;
	}

	public Double getLat() {
		return lat;
	}

	public void setLat(Double lat) {
		this.lat = lat;
	}

	public Double getLng() {
		return lng;
	}

	public void setLng(Double lng) {
		this.lng = lng;
	}

}
