package com.joooin.model;

import java.io.Serializable;
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
	private Set<GroupMemberBean> GroupMemberSet = new LinkedHashSet<GroupMemberBean>();
	private Set<GroupPostBean> GroupPostSet = new LinkedHashSet<GroupPostBean>();
	private Set<GroupPostReplyBean> GroupPostReplySet = new LinkedHashSet<GroupPostReplyBean>();
	private Set<GroupChatBean> groupChatSet = new LinkedHashSet<GroupChatBean>();
	
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
	public Set<GroupMemberBean> getGroupMemberSet() {
		return GroupMemberSet;
	}
	public void setGroupMemberSet(Set<GroupMemberBean> groupMemberSet) {
		GroupMemberSet = groupMemberSet;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="groupId", referencedColumnName="groupId")
	public Set<GroupPostBean> getGroupPostSet() {
		return GroupPostSet;
	}
	public void setGroupPostSet(Set<GroupPostBean> groupPostSet) {
		GroupPostSet = groupPostSet;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="groupId", referencedColumnName="groupId")
	public Set<GroupPostReplyBean> getGroupPostReplySet() {
		return GroupPostReplySet;
	}
	public void setGroupPostReplySet(Set<GroupPostReplyBean> groupPostReplySet) {
		GroupPostReplySet = groupPostReplySet;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="groupId", referencedColumnName="groupId")
	public Set<GroupChatBean> getGroupChatSet() {
		return groupChatSet;
	}
	public void setGroupChatSet(Set<GroupChatBean> groupChatSet) {
		this.groupChatSet = groupChatSet;
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
