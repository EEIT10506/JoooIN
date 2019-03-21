package com.joooin.system.admin._03.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class AllEventQuantityBean {
	@Id
	Integer eventId;
	String eventTypeId;
	public Integer getEventId() {
		return eventId;
	}
	public void setEventId(Integer eventId) {
		this.eventId = eventId;
	}
	public String getEventTypeId() {
		return eventTypeId;
	}
	public void setEventTypeId(String eventTypeId) {
		this.eventTypeId = eventTypeId;
	}
}
