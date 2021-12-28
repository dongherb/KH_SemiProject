package kh.com.semi.dto;

public class CenterPicDTO {
	private int center_picSeq;
	private int center_seq;
	private String origin_name;
	private String system_name;
	private String picAddr;
	
	public CenterPicDTO() {}

	public CenterPicDTO(int center_picSeq, int center_seq, String origin_name, String system_name, String picAddr) {
		super();
		this.center_picSeq = center_picSeq;
		this.center_seq = center_seq;
		this.origin_name = origin_name;
		this.system_name = system_name;
		this.picAddr = picAddr;
	}

	public int getCenter_picSeq() {
		return center_picSeq;
	}

	public void setCenter_picSeq(int center_picSeq) {
		this.center_picSeq = center_picSeq;
	}

	public int getCenter_seq() {
		return center_seq;
	}

	public void setCenter_seq(int center_seq) {
		this.center_seq = center_seq;
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
