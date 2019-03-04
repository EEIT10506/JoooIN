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
@Table(name="event_type")
public class EventTypeBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer eventTypeId;
	private String eventType;
	private Set<EventMainBean> eventMainSet = new LinkedHashSet<EventMainBean>();
	
	public EventTypeBean(String eventType) {
		this.eventType = eventType;
	}
	public EventTypeBean() {
	}
	
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="eventTypeId", referencedColumnName="eventTypeId")
	public Set<EventMainBean> getEventMainSet() {
		return eventMainSet;
	}
	public void setEventMainSet(Set<EventMainBean> eventMainSet) {
		this.eventMainSet = eventMainSet;
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getEventTypeId() {
		return eventTypeId;
	}
	public void setEventTypeId(Integer eventTypeId) {
		this.eventTypeId = eventTypeId;
	}
	public String getEventType() {
		return eventType;
	}
	public void setEventType(String eventType) {
		this.eventType = eventType;
	}
	
	
	
	
}
