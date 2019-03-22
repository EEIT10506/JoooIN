package com.joooin.system.group._22.pojo;

public class Poster {
	private Integer groupPostId;
	private Integer groupId;
	private Integer memberId;
	private String groupPostTitle;
	private Byte[] groupPostImage;
	private String groupPostText;
	private Integer groupPostLike;
	private String groupPostDate;
	private Boolean isDeleted;
	private String memberName;
	
	public Integer getGroupPostId() {
		return groupPostId;
	}
	public void setGroupPostId(Integer groupPostId) {
		this.groupPostId = groupPostId;
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
	public String getGroupPostTitle() {
		return groupPostTitle;
	}
	public void setGroupPostTitle(String groupPostTitle) {
		this.groupPostTitle = groupPostTitle;
	}
	public Byte[] getGroupPostImage() {
		return groupPostImage;
	}
	public void setGroupPostImage(Byte[] groupPostImage) {
		this.groupPostImage = groupPostImage;
	}
	public Integer getGroupPostLike() {
		return groupPostLike;
	}
	public void setGroupPostLike(Integer groupPostLike) {
		this.groupPostLike = groupPostLike;
	}
	public String getGroupPostDate() {
		return groupPostDate;
	}
	public void setGroupPostDate(String groupPostDate) {
		this.groupPostDate = groupPostDate;
	}
	public Boolean getIsDeleted() {
		return isDeleted;
	}
	public void setIsDeleted(Boolean isDeleted) {
		this.isDeleted = isDeleted;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getGroupPostText() {
		return groupPostText;
	}
	public void setGroupPostText(String groupPostText) {
		this.groupPostText = groupPostText;
	}

}
