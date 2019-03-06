package com.joooin.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="member_friend")
public class MemberFriendBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer memberFriendId;
	private Integer inviteMemberId;
	private Integer receiveMemberId;
	private Boolean isFriend;
	private Boolean isInviter;
	
	public MemberFriendBean(Integer inviteMemberId, Integer receiveMemberId, Boolean isFriend, Boolean isInviter) {
		super();
		this.inviteMemberId = inviteMemberId;
		this.receiveMemberId = receiveMemberId;
		this.isFriend = isFriend;
		this.isInviter = isInviter;
	}
	public MemberFriendBean() {
		super();
	}
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getMemberFriendId() {
		return memberFriendId;
	}
	public void setMemberFriendId(Integer memberFriendId) {
		this.memberFriendId = memberFriendId;
	}
	public Integer getInviteMemberId() {
		return inviteMemberId;
	}
	public void setInviteMemberId(Integer inviteMemberId) {
		this.inviteMemberId = inviteMemberId;
	}
	public Integer getReceiveMemberId() {
		return receiveMemberId;
	}
	public void setReceiveMemberId(Integer receiveMemberId) {
		this.receiveMemberId = receiveMemberId;
	}
	public Boolean getIsFriend() {
		return isFriend;
	}
	public void setIsFriend(Boolean isFriend) {
		this.isFriend = isFriend;
	}
	public Boolean getIsInviter() {
		return isInviter;
	}
	public void setIsInviter(Boolean isInviter) {
		this.isInviter = isInviter;
	}
}
