package com.joooin.model;

import java.io.Serializable;
import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="group_post")
public class GroupPostBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer groupPostId;
	private Integer groupId;
	private Integer memberId;
	private String groupPostTitle;
	private Byte[] groupPostContent;
	private Integer groupPostLike;
	private String groupPostDate;
	private Boolean isDeleted;
	private Set<GroupPostLikeBean> groupPostLikeSet = new LinkedHashSet<GroupPostLikeBean>();
	private Set<GroupPostReplyBean> GroupPostReplySet = new LinkedHashSet<GroupPostReplyBean>();
	
	public GroupPostBean(Integer groupId, Integer memberId, String groupPostTitle, Byte[] groupPostContent,
			Integer groupPostLike, String groupPostDate, Boolean isDeleted) {
		super();
		this.groupId = groupId;
		this.memberId = memberId;
		this.groupPostTitle = groupPostTitle;
		this.groupPostContent = groupPostContent;
		this.groupPostLike = groupPostLike;
		this.groupPostDate = groupPostDate;
		this.isDeleted = isDeleted;
	}
	public GroupPostBean() {
		super();
	}
	
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="groupPostId", referencedColumnName="groupPostId")
	public Set<GroupPostLikeBean> getGroupPostLikeSet() {
		return groupPostLikeSet;
	}
	public void setGroupPostLikeSet(Set<GroupPostLikeBean> groupPostLikeSet) {
		this.groupPostLikeSet = groupPostLikeSet;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="groupPostId", referencedColumnName="groupPostId")
	public Set<GroupPostReplyBean> getGroupPostReplySet() {
		return GroupPostReplySet;
	}
	public void setGroupPostReplySet(Set<GroupPostReplyBean> groupPostReplySet) {
		GroupPostReplySet = groupPostReplySet;
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
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
	public Byte[] getGroupPostContent() {
		return groupPostContent;
	}
	public void setGroupPostContent(Byte[] groupPostContent) {
		this.groupPostContent = groupPostContent;
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
	@Override
	public String toString() {
		return "GroupPostBean [groupPostId=" + groupPostId + ", groupId=" + groupId + ", memberId=" + memberId
				+ ", groupPostTitle=" + groupPostTitle + ", groupPostContent=" + Arrays.toString(groupPostContent)
				+ ", groupPostLike=" + groupPostLike + ", groupPostDate=" + groupPostDate + ", isDeleted=" + isDeleted
				+ "]";
	}
	
}