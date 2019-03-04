package com.joooin.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="group_member")
public class GroupMemberBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer groupMemberId;
	private Integer groupId;
	private Integer memberId;
	private Boolean isAgreed;
	
	public GroupMemberBean(Integer groupId, Integer memberId, Boolean isAgreed) {
		super();
		this.groupId = groupId;
		this.memberId = memberId;
		this.isAgreed = isAgreed;
	}

	public GroupMemberBean() {
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getGroupMemberId() {
		return groupMemberId;
	}
	public void setGroupMemberId(Integer groupMemberId) {
		this.groupMemberId = groupMemberId;
	}
	
	public Integer getGroupId() {
		return groupId;
	}
	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	public Boolean getIsAgreed() {
		return isAgreed;
	}
	public void setIsAgreed(Boolean isAgreed) {
		this.isAgreed = isAgreed;
	}

	@Override
	public String toString() {
		return "GroupMemberBean [groupMemberId=" + groupMemberId + ", groupId=" + groupId + ", memberId=" + memberId
				+ ", isAgreed=" + isAgreed + "]";
	}
	
	
}
