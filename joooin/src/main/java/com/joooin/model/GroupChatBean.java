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
	private Byte[] groupChatImage;
	private String groupChatText;
	private String groupChatDate;
	private String groupChatType;
	
	
	public GroupChatBean(Integer groupId, Integer memberId, Byte[] groupChatImage, String groupChatText,
			String groupChatDate, String groupChatType) {
		super();
		this.groupId = groupId;
		this.memberId = memberId;
		this.groupChatImage = groupChatImage;
		this.groupChatText = groupChatText;
		this.groupChatDate = groupChatDate;
		this.groupChatType = groupChatType;
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
	public Byte[] getGroupChatImage() {
		return groupChatImage;
	}
	public void setGroupChatImage(Byte[] groupChatImage) {
		this.groupChatImage = groupChatImage;
	}
	public String getGroupChatDate() {
		return groupChatDate;
	}
	public void setGroupChatDate(String groupChatDate) {
		this.groupChatDate = groupChatDate;
	}
	public String getGroupChatText() {
		return groupChatText;
	}
	public void setGroupChatText(String groupChatText) {
		this.groupChatText = groupChatText;
	}
	public String getGroupChatType() {
		return groupChatType;
	}
	public void setGroupChatType(String groupChatType) {
		this.groupChatType = groupChatType;
	}
	
	
	
	
}
