package com.joooin.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="event_like")
public class EventLikeBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer eventLikeId;
	private Integer eventId;
	private Integer memberId;
	
	public EventLikeBean(Integer eventId, Integer memberId) {
		super();
		this.eventId = eventId;
		this.memberId = memberId;
	}
	public EventLikeBean() {
		super();
	}
	
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getEventLikeId() {
		return eventLikeId;
	}
	public void setEventLikeId(Integer eventLikeId) {
		this.eventLikeId = eventLikeId;
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
	
}
