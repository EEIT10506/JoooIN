package com.joooin.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="group_chat")
public class GroupChatBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer groupChatId;
	private Integer groupId;
	private Integer memberId;
	private Byte[] groupChatContent;
	private String groupChatDate;
	
	public GroupChatBean(Integer groupId, Integer memberId, Byte[] groupChatContent, String groupChatDate) {
		super();
		this.groupId = groupId;
		this.memberId = memberId;
		this.groupChatContent = groupChatContent;
		this.groupChatDate = groupChatDate;
	}
	public GroupChatBean() {
		super();
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getGroupChatId() {
		return groupChatId;
	}
	public void setGroupChatId(Integer groupChatId) {
		this.groupChatId = groupChatId;
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
	public Byte[] getGroupChatContent() {
		return groupChatContent;
	}
	public void setGroupChatContent(Byte[] groupChatContent) {
		this.groupChatContent = groupChatContent;
	}
	public String getGroupChatDate() {
		return groupChatDate;
	}
	public void setGroupChatDate(String groupChatDate) {
		this.groupChatDate = groupChatDate;
	}
	
	
	
	
}
