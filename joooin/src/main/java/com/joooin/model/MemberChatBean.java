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
	private String messageText;
	private Byte[] messageImage;
	private String messageDate;
	private String messageType;	
	private String messageHash;
	private Boolean isRead;
	
	
	public MemberChatBean(Integer memberChatId, Integer sendMemberId, Integer receiveMemberId, String messageText,
			Byte[] messageImage, String messageDate, String messageType, String messageHash, Boolean isRead) {
		super();
		this.memberChatId = memberChatId;
		this.sendMemberId = sendMemberId;
		this.receiveMemberId = receiveMemberId;
		this.messageText = messageText;
		this.messageImage = messageImage;
		this.messageDate = messageDate;
		this.messageType = messageType;
		this.messageHash = messageHash;
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
	public Boolean getIsRead() {
		return isRead;
	}
	public void setIsRead(Boolean isRead) {
		this.isRead = isRead;
	}
	public String getMessageHash() {
		return messageHash;
	}
	public void setMessageHash(String messageHash) {
		this.messageHash = messageHash;
	}
	public String getMessageText() {
		return messageText;
	}
	public void setMessageText(String messageText) {
		this.messageText = messageText;
	}
	public Byte[] getMessageImage() {
		return messageImage;
	}
	public void setMessageImage(Byte[] messageImage) {
		this.messageImage = messageImage;
	}
	public String getMessageDate() {
		return messageDate;
	}
	public void setMessageDate(String messageDate) {
		this.messageDate = messageDate;
	}
	public String getMessageType() {
		return messageType;
	}
	public void setMessageType(String messageType) {
		this.messageType = messageType;
	}
	
	

}
