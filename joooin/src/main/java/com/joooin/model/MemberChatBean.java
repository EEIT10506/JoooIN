package com.joooin.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="member_chat")
public class MemberChatBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer memberChatId;
	private Integer sendMemberId;
	private Integer receiveMemberId;
	private Byte[] memberChatContent;
	private String memberChatDate;
	private Boolean isRead;
	
	public MemberChatBean(Integer sendMemberId, Integer receiveMemberId, Byte[] memberChatContent,
			String memberChatDate, Boolean isRead) {
		super();
		this.sendMemberId = sendMemberId;
		this.receiveMemberId = receiveMemberId;
		this.memberChatContent = memberChatContent;
		this.memberChatDate = memberChatDate;
		this.isRead = isRead;
	}
	public MemberChatBean() {
		super();
	}
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getMemberChatId() {
		return memberChatId;
	}
	public void setMemberChatId(Integer memberChatId) {
		this.memberChatId = memberChatId;
	}
	public Integer getSendMemberId() {
		return sendMemberId;
	}
	public void setSendMemberId(Integer sendMemberId) {
		this.sendMemberId = sendMemberId;
	}
	public Integer getReceiveMemberId() {
		return receiveMemberId;
	}
	public void setReceiveMemberId(Integer receiveMemberId) {
		this.receiveMemberId = receiveMemberId;
	}
	public Byte[] getMemberChatContent() {
		return memberChatContent;
	}
	public void setMemberChatContent(Byte[] memberChatContent) {
		this.memberChatContent = memberChatContent;
	}
	public String getMemberChatDate() {
		return memberChatDate;
	}
	public void setMemberChatDate(String memberChatDate) {
		this.memberChatDate = memberChatDate;
	}
	public Boolean getIsRead() {
		return isRead;
	}
	public void setIsRead(Boolean isRead) {
		this.isRead = isRead;
	}
	
	

}
