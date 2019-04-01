package com.joooin.system.admin._03.model;

public class MemberMainPojo {
	
	private Integer memberId;
	private String memberName;
	private String email;
	private String gender;
	private Integer logins;
	private String memberCreateDate;
	private Boolean certificationStatus;
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Integer getLogins() {
		return logins;
	}
	public void setLogins(Integer logins) {
		this.logins = logins;
	}
	public String getMemberCreateDate() {
		return memberCreateDate;
	}
	public void setMemberCreateDate(String memberCreateDate) {
		this.memberCreateDate = memberCreateDate;
	}
	public Boolean getCertificationStatus() {
		return certificationStatus;
	}
	public void setCertificationStatus(Boolean certificationStatus) {
		this.certificationStatus = certificationStatus;
	}
	
	

}
