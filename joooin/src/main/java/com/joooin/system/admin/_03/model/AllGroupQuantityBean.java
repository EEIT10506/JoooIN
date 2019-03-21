package com.joooin.system.admin._03.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class AllGroupQuantityBean {
	@Id
	Integer groupId;
	String groupType;
	public Integer getGroupId() {
		return groupId;
	}
	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}
	public String getGroupType() {
		return groupType;
	}
	public void setGroupType(String groupType) {
		this.groupType = groupType;
	}
}
