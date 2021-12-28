package kh.com.semi.dto;

public class CenterSearchDTO {
	private int center_seq;
	private String center_name;
	private int center_price; 
	private String exercise; 
	private String center_tel; 
	private String extraAddr;
	private Double lat;
	private Double lng;
	private int center_picSeq;
	private String origin_name ;
	private String system_name ;
	private String picAddr;
	public CenterSearchDTO() {}
	public CenterSearchDTO(int center_seq, String center_name, int center_price, String exercise, String center_tel,
			String extraAddr, Double lat, Double lng, int center_picSeq, String origin_name, String system_name,
			String picAddr) {
		super();
		this.center_seq = center_seq;
		this.center_name = center_name;
		this.center_price = center_price;
		this.exercise = exercise;
		this.center_tel = center_tel;
		this.extraAddr = extraAddr;
		this.lat = lat;
		this.lng = lng;
		this.center_picSeq = center_picSeq;
		this.origin_name = origin_name;
		this.system_name = system_name;
		this.picAddr = picAddr;
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
	public String getExtraAddr() {
		return extraAddr;
	}
	public void setExtraAddr(String extraAddr) {
		this.extraAddr = extraAddr;
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
	public int getCenter_picSeq() {
		return center_picSeq;
	}
	public void setCenter_picSeq(int center_picSeq) {
		this.center_picSeq = center_picSeq;
	}
	public String getOrigin_name() {
		return origin_name;
	}
	public void setOrigin_name(String origin_name) {
		this.origin_name = origin_name;
	}
	public String getSystem_name() {
		return system_name;
	}
	public void setSystem_name(String system_name) {
		this.system_name = system_name;
	}
	public String getPicAddr() {
		return picAddr;
	}
	public void setPicAddr(String picAddr) {
		this.picAddr = picAddr;
	}
	
	
}
