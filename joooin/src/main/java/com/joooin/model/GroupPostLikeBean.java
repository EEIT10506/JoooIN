package com.joooin.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="group_post_like")
public class GroupPostLikeBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer groupPostLikeId;
	private Integer groupPostId;
	private Integer memberId;
	private Boolean isLiked;
	
	public GroupPostLikeBean(Integer groupPostId, Integer memberId, Boolean isLiked) {
		super();
		this.groupPostId = groupPostId;
		this.memberId = memberId;
		this.isLiked = isLiked;
	}
	public GroupPostLikeBean() {
		super();
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getGroupPostLikeId() {
		return groupPostLikeId;
	}
	public void setGroupPostLikeId(Integer groupPostLikeId) {
		this.groupPostLikeId = groupPostLikeId;
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
	public Boolean getIsLiked() {
		return isLiked;
	}
	public void setIsLiked(Boolean isLiked) {
		this.isLiked = isLiked;
	}
	
	
}
