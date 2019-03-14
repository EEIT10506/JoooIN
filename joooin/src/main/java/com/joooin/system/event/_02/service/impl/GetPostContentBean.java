package com.joooin.system.event._02.service.impl;

public class GetPostContentBean {
	
	private String memberName;
	private String eventPostContent;
	private String eventPostDate;
	private Byte[] memberImage;
	private Boolean isDeleted;
	private Integer eventPostId;
	private Integer memberId;
	public GetPostContentBean() {
	}
	
	public GetPostContentBean(String memberName, String eventPostContent, String eventPostDate, Byte[] memberImage,
			Boolean isDeleted, Integer eventPostId, Integer memberId) {
		super();
		this.memberName = memberName;
		this.eventPostContent = eventPostContent;
		this.eventPostDate = eventPostDate;
		this.memberImage = memberImage;
		this.isDeleted = isDeleted;
		this.eventPostId = eventPostId;
		this.memberId = memberId;
	}

	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getEventPostContent() {
		return eventPostContent;
	}
	public void setEventPostContent(String eventPostContent) {
		this.eventPostContent = eventPostContent;
	}
	public String getEventPostDate() {
		return eventPostDate;
	}
	public void setEventPostDate(String eventPostDate) {
		this.eventPostDate = eventPostDate;
	}
	public Byte[] getMemberImage() {
		return memberImage;
	}
	public void setMemberImage(Byte[] memberImage) {
		this.memberImage = memberImage;
	}

	public Boolean getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(Boolean isDeleted) {
		this.isDeleted = isDeleted;
	}

	public Integer getEventPostId() {
		return eventPostId;
	}

	public void setEventPostId(Integer eventPostId) {
		this.eventPostId = eventPostId;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	
}
