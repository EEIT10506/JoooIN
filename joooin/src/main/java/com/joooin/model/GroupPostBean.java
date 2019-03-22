package com.joooin.model;

import java.io.Serializable;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="group_post")
public class GroupPostBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer groupPostId;
	private Integer groupId;
	private Integer memberId;
	private String groupPostTitle;
	private Byte[] groupPostImage;
	private String groupPostText;
	private Integer groupPostLike;
	private String groupPostDate;
	private Boolean isDeleted;
	private MultipartFile multipartFile;
	private List<GroupPostLikeBean> groupPostLikeList = new ArrayList<GroupPostLikeBean>();
	private List<GroupPostReplyBean> GroupPostReplyList = new ArrayList<GroupPostReplyBean>();
	
	public GroupPostBean(Integer groupId, Integer memberId, String groupPostTitle, Byte[] groupPostImage,
			Integer groupPostLike, String groupPostDate, Boolean isDeleted, String groupPostText) {
		super();
		this.groupId = groupId;
		this.memberId = memberId;
		this.groupPostTitle = groupPostTitle;
		this.groupPostImage = groupPostImage;
		this.groupPostText = groupPostText;
		this.groupPostLike = groupPostLike;
		this.groupPostDate = groupPostDate;
		this.isDeleted = isDeleted;
	}
	public GroupPostBean() {
		super();
	}
	
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="groupPostId", referencedColumnName="groupPostId")
	public List<GroupPostLikeBean> getGroupPostLikeList() {
		return groupPostLikeList;
	}
	public void setGroupPostLikeList(List<GroupPostLikeBean> groupPostLikeList) {
		this.groupPostLikeList = groupPostLikeList;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="groupPostId", referencedColumnName="groupPostId")
	public List<GroupPostReplyBean> getGroupPostReplyList() {
		return GroupPostReplyList;
	}
	public void setGroupPostReplyList(List<GroupPostReplyBean> groupPostReplyList) {
		GroupPostReplyList = groupPostReplyList;
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
	@Transient
	public MultipartFile getMultipartFile() {
		return multipartFile;
	}
	public void setMultipartFile(MultipartFile multipartFile) {
		this.multipartFile = multipartFile;
	}
	public String getGroupPostText() {
		return groupPostText;
	}
	public void setGroupPostText(String groupPostText) {
		this.groupPostText = groupPostText;
	}
	@Override
	public String toString() {
		return "GroupPostBean [groupPostId=" + groupPostId + ", groupId=" + groupId + ", memberId=" + memberId
				+ ", groupPostTitle=" + groupPostTitle + ", groupPostContent=" + Arrays.toString(groupPostImage)
				+ ", groupPostLike=" + groupPostLike + ", groupPostDate=" + groupPostDate + ", isDeleted=" + isDeleted
				+ "]";
	}
}
