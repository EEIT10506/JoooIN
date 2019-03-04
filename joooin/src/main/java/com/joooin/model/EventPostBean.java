package com.joooin.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="event_post")
public class EventPostBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer eventPostId;
	private Integer eventId;
	private Integer memberId;
	private String eventPostContent;
	private String eventPostDate;
	private Boolean isDeleted;
	
	public EventPostBean(Integer eventId, Integer memberId, String eventPostContent, String eventPostDate,
			Boolean isDeleted) {
		super();
		this.eventId = eventId;
		this.memberId = memberId;
		this.eventPostContent = eventPostContent;
		this.eventPostDate = eventPostDate;
		this.isDeleted = isDeleted;
	}
	public EventPostBean() {
		super();
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getEventPostId() {
		return eventPostId;
	}
	public void setEventPostId(Integer eventPostId) {
		this.eventPostId = eventPostId;
	}
	public Integer getEventId() {
		return eventId;
	}
	public void setEventId(Integer eventId) {
		this.eventId = eventId;
	}
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	public String getEventPostContent() {
		return eventPostContent;
	}
	public void setEventPostContent(String eventPostContent) {
		this.eventPostContent = eventPostContent;
	}
	public String getEventPostDate() {
		return eventPostDate;
	}
	public void setEventPostDate(String eventPostDate) {
		this.eventPostDate = eventPostDate;
	}
	public Boolean getIsDeleted() {
		return isDeleted;
	}
	public void setIsDeleted(Boolean isDeleted) {
		this.isDeleted = isDeleted;
	}

}
