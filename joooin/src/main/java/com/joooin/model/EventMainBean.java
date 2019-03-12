package com.joooin.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="event_main")
public class EventMainBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer eventId;
	private String eventName;
	private String eventDateStart;
	private String eventDateEnd;
	private String eventLocation;
	private String eventAddress;
	private Double eventLatitude;
	private Double eventLongitude;
	private String eventContent;
	private Integer eventTypeId;
	private Integer eventInviterId;
	private Integer eventLike;
	private Integer eventMemberLimit;
	private Integer eventFee;
	private Boolean isFull;
	private Integer eventCurrentMembers;
	private Byte[] eventImage;
	private String eventStatus;
	private List<EventMemberBean> eventMemberList = new ArrayList<EventMemberBean>();
	private List<EventPostBean> eventPostList = new ArrayList<EventPostBean>();
	private List<EventLikeBean> eventLikeList = new ArrayList<EventLikeBean>();
	
	public EventMainBean(String eventName, String eventDateStart, String eventDateEnd, String eventLocation,
			String eventAddress, Double eventLatitude, Double eventLongitude, String eventContent, Integer eventTypeId,
			Integer eventInviterId, Integer eventLike, Integer eventMemberLimit, Integer eventFee, Boolean isFull,
			Integer eventCurrentMembers, Byte[] eventImage, String eventStatus) {
		super();
		this.eventName = eventName;
		this.eventDateStart = eventDateStart;
		this.eventDateEnd = eventDateEnd;
		this.eventLocation = eventLocation;
		this.eventAddress = eventAddress;
		this.eventLatitude = eventLatitude;
		this.eventLongitude = eventLongitude;
		this.eventContent = eventContent;
		this.eventTypeId = eventTypeId;
		this.eventInviterId = eventInviterId;
		this.eventLike = eventLike;
		this.eventMemberLimit = eventMemberLimit;
		this.eventFee = eventFee;
		this.isFull = isFull;
		this.eventCurrentMembers = eventCurrentMembers;
		this.eventImage = eventImage;
		this.eventStatus = eventStatus;
	}
	public EventMainBean() {
		super();
	}
	
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="eventId", referencedColumnName="eventId")
	public List<EventMemberBean> getEventMemberList() {
		return eventMemberList;
	}
	public void setEventMemberList(List<EventMemberBean> eventMemberList) {
		this.eventMemberList = eventMemberList;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="eventId", referencedColumnName="eventId")
	public List<EventPostBean> getEventPostList() {
		return eventPostList;
	}
	public void setEventPostList(List<EventPostBean> eventPostList) {
		this.eventPostList = eventPostList;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="eventId", referencedColumnName="eventId")
	public List<EventLikeBean> getEventLikeList() {
		return eventLikeList;
	}
	public void setEventLikeList(List<EventLikeBean> eventLikeList) {
		this.eventLikeList = eventLikeList;
	}
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getEventId() {
		return eventId;
	}
	public void setEventId(Integer eventId) {
		this.eventId = eventId;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public String getEventDateStart() {
		return eventDateStart;
	}
	public void setEventDateStart(String eventDateStart) {
		this.eventDateStart = eventDateStart;
	}
	public String getEventDateEnd() {
		return eventDateEnd;
	}
	public void setEventDateEnd(String eventDateEnd) {
		this.eventDateEnd = eventDateEnd;
	}
	public String getEventLocation() {
		return eventLocation;
	}
	public void setEventLocation(String eventLocation) {
		this.eventLocation = eventLocation;
	}
	public String getEventAddress() {
		return eventAddress;
	}
	public void setEventAddress(String eventAddress) {
		this.eventAddress = eventAddress;
	}
	public Double getEventLatitude() {
		return eventLatitude;
	}
	public void setEventLatitude(Double eventLatitude) {
		this.eventLatitude = eventLatitude;
	}
	public Double getEventLongitude() {
		return eventLongitude;
	}
	public void setEventLongitude(Double eventLongitude) {
		this.eventLongitude = eventLongitude;
	}
	public String getEventContent() {
		return eventContent;
	}
	public void setEventContent(String eventContent) {
		this.eventContent = eventContent;
	}
	public Integer getEventTypeId() {
		return eventTypeId;
	}
	public void setEventTypeId(Integer eventTypeId) {
		this.eventTypeId = eventTypeId;
	}
	public Integer getEventInviterId() {
		return eventInviterId;
	}
	public void setEventInviterId(Integer eventInviterId) {
		this.eventInviterId = eventInviterId;
	}
	public Integer getEventLike() {
		return eventLike;
	}
	public void setEventLike(Integer eventLike) {
		this.eventLike = eventLike;
	}
	public Integer getEventMemberLimit() {
		return eventMemberLimit;
	}
	public void setEventMemberLimit(Integer eventMemberLimit) {
		this.eventMemberLimit = eventMemberLimit;
	}
	public Integer getEventFee() {
		return eventFee;
	}
	public void setEventFee(Integer eventFee) {
		this.eventFee = eventFee;
	}
	public Boolean getIsFull() {
		return isFull;
	}
	public void setIsFull(Boolean isFull) {
		this.isFull = isFull;
	}
	public Integer getEventCurrentMembers() {
		return eventCurrentMembers;
	}
	public void setEventCurrentMembers(Integer eventCurrentMembers) {
		this.eventCurrentMembers = eventCurrentMembers;
	}
	public Byte[] getEventImage() {
		return eventImage;
	}
	public void setEventImage(Byte[] eventImage) {
		this.eventImage = eventImage;
	}
	public String getEventStatus() {
		return eventStatus;
	}
	public void setEventStatus(String eventStatus) {
		this.eventStatus = eventStatus;
	}

}
