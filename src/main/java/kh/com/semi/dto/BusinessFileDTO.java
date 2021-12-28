package kh.com.semi.dto;

public class BusinessFileDTO {

	private int business_picSeq;
	private String id;
	private String origin_name;
	private String system_name;
	private String fileAddr;
	
	public BusinessFileDTO() {}

	public BusinessFileDTO(int business_picSeq, String id, String origin_name, String system_name, String fileAddr) {
		super();
		this.business_picSeq = business_picSeq;
		this.id = id;
		this.origin_name = origin_name;
		this.system_name = system_name;
		this.fileAddr = fileAddr;
	}

	public int getBusiness_picSeq() {
		return business_picSeq;
	}

	public void setBusiness_picSeq(int business_picSeq) {
		this.business_picSeq = business_picSeq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getFileAddr() {
		return fileAddr;
	}

	public void setFileAddr(String fileAddr) {
		this.fileAddr = fileAddr;
	}

}
