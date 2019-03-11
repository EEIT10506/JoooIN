package com.joooin.model;

import java.io.Serializable;
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

@Entity
@Table(name="group_main")
public class GroupMainBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer groupId;
	private String groupType;
	private String groupName;
	private Integer groupLeaderId;
	private Integer groupCurrentMembers;
	private String groupCreateDate;
	private String groupIntro;
	private List<GroupMemberBean> GroupMemberList = new ArrayList<GroupMemberBean>();
	private List<GroupPostBean> GroupPostList = new ArrayList<GroupPostBean>();
	private List<GroupPostReplyBean> GroupPostReplyList = new ArrayList<GroupPostReplyBean>();
	private List<GroupChatBean> groupChatList = new ArrayList<GroupChatBean>();
	
	public GroupMainBean(String groupType, String groupName, Integer groupLeaderId,
			Integer groupCurrentMembers, String groupCreateDate, String groupIntro) {
		super();
		this.groupType = groupType;
		this.groupName = groupName;
		this.groupLeaderId = groupLeaderId;
		this.groupCurrentMembers = groupCurrentMembers;
		this.groupCreateDate = groupCreateDate;
		this.groupIntro = groupIntro;
	}
	public GroupMainBean() {
	}
	
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="groupId", referencedColumnName="groupId")
	public List<GroupMemberBean> getGroupMemberList() {
		return GroupMemberList;
	}
	public void setGroupMemberList(List<GroupMemberBean> groupMemberList) {
		GroupMemberList = groupMemberList;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="groupId", referencedColumnName="groupId")
	public List<GroupPostBean> getGroupPostList() {
		return GroupPostList;
	}
	public void setGroupPostList(List<GroupPostBean> groupPostList) {
		GroupPostList = groupPostList;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="groupId", referencedColumnName="groupId")
	public List<GroupPostReplyBean> getGroupPostReplyList() {
		return GroupPostReplyList;
	}
	public void setGroupPostReplyList(List<GroupPostReplyBean> groupPostReplyList) {
		GroupPostReplyList = groupPostReplyList;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="groupId", referencedColumnName="groupId")
	public List<GroupChatBean> getGroupChatList() {
		return groupChatList;
	}
	public void setGroupChatList(List<GroupChatBean> groupChatList) {
		this.groupChatList = groupChatList;
	}
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
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

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	
	public Integer getGroupLeaderId() {
		return groupLeaderId;
	}

	public void setGroupLeaderId(Integer groupLeaderId) {
		this.groupLeaderId = groupLeaderId;
	}


	public Integer getGroupCurrentMembers() {
		return groupCurrentMembers;
	}

	public void setGroupCurrentMembers(Integer groupCurrentMembers) {
		this.groupCurrentMembers = groupCurrentMembers;
	}

	public String getGroupCreateDate() {
		return groupCreateDate;
	}

	public void setGroupCreateDate(String groupCreateDate) {
		this.groupCreateDate = groupCreateDate;
	}

	public String getGroupIntro() {
		return groupIntro;
	}

	public void setGroupIntro(String groupIntro) {
		this.groupIntro = groupIntro;
	}

	
}
