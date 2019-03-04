package com.joooin.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="group_post_reply")
public class GroupPostReplyBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer groupPostReplyId;
	private Integer groupId;
	private Integer groupPostId;
	private Integer memberId;
	private String groupPostReplyContent;
	private String groupPostReplyDate;
	private Boolean isDeleted;
	
	public GroupPostReplyBean(Integer groupId, Integer groupPostId, Integer memberId, String groupPostReplyContent,
			String groupPostReplyDate, Boolean isDeleted) {
		super();
		this.groupId = groupId;
		this.groupPostId = groupPostId;
		this.memberId = memberId;
		this.groupPostReplyContent = groupPostReplyContent;
		this.groupPostReplyDate = groupPostReplyDate;
		this.isDeleted = isDeleted;
	}
	public GroupPostReplyBean() {
		super();
	}
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getGroupPostReplyId() {
		return groupPostReplyId;
	}
	public void setGroupPostReplyId(Integer groupPostReplyId) {
		this.groupPostReplyId = groupPostReplyId;
	}
	public Integer getGroupId() {
		return groupId;
	}
	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}
	public Integer getGroupPostId() {
		return groupPostId;
	}
	public void setGroupPostId(Integer groupPostId) {
		this.groupPostId = groupPostId;
	}
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	public String getGroupPostReplyContent() {
		return groupPostReplyContent;
	}
	public void setGroupPostReplyContent(String groupPostReplyContent) {
		this.groupPostReplyContent = groupPostReplyContent;
	}
	public String getGroupPostReplyDate() {
		return groupPostReplyDate;
	}
	public void setGroupPostReplyDate(String groupPostReplyDate) {
		this.groupPostReplyDate = groupPostReplyDate;
	}
	public Boolean getIsDeleted() {
		return isDeleted;
	}
	public void setIsDeleted(Boolean isDeleted) {
		this.isDeleted = isDeleted;
	}

	
}
