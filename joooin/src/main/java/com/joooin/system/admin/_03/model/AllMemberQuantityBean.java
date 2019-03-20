package com.joooin.system.admin._03.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class AllMemberQuantityBean {
	@Id
	Integer memberId;
	String gender;

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

}
