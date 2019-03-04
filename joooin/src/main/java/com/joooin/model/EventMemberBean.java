package com.joooin.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="event_member")
public class EventMemberBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer eventMemberId;
	private Integer eventId;
	private Integer memberId;
	private Integer quantity;
	private Boolean isPaid;
	private Boolean isAttended;
	private Boolean isAgreed;
	
	public EventMemberBean(Integer eventId, Integer memberId, Integer quantity, Boolean isPaid, Boolean isAttended,
			Boolean isAgreed) {
		super();
		this.eventId = eventId;
		this.memberId = memberId;
		this.quantity = quantity;
		this.isPaid = isPaid;
		this.isAttended = isAttended;
		this.isAgreed = isAgreed;
	}
	public EventMemberBean() {
		super();
	}
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getEventMemberId() {
		return eventMemberId;
	}
	public void setEventMemberId(Integer eventMemberId) {
		this.eventMemberId = eventMemberId;
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
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Boolean getIsPaid() {
		return isPaid;
	}
	public void setIsPaid(Boolean isPaid) {
		this.isPaid = isPaid;
	}
	public Boolean getIsAttended() {
		return isAttended;
	}
	public void setIsAttended(Boolean isAttended) {
		this.isAttended = isAttended;
	}
	public Boolean getIsAgreed() {
		return isAgreed;
	}
	public void setIsAgreed(Boolean isAgreed) {
		this.isAgreed = isAgreed;
	}
	
}
