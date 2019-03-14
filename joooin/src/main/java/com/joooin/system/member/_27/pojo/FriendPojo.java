package com.joooin.system.member._27.pojo;

public class FriendPojo {
	private Integer memberId;
	private String memberName;
	private Boolean isFriend;
	private Boolean isInviter;
	
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
	@Override
	public String toString() {
		return "FriendPojo [memberId=" + memberId + ", memberName=" + memberName + ", isFriend=" + isFriend
				+ ", isInviter=" + isInviter + "]";
	}
	
	
}
