package com.joooin.system.event._35.service;

import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;
import java.util.List;

import com.joooin.model.EventMainBean;
import com.joooin.model.GroupMainBean;
import com.joooin.model.GroupPostBean;
import com.joooin.model.NotificationBean;

public interface EventsService {
	public EventMainBean getByEventMainId(Integer eventId);
	public List<EventMainBean> getAll();
	public Integer save(EventMainBean eventMainBean);
	public void update(EventMainBean eventMainBean);
	public void deleteByEventId(Integer eventId);
	
	public Integer processeventlike(Integer eventId,Integer memberId);
    
	public String displayeventlike(Integer eventId,Integer memberId);
	
	public List<EventMainBean> getTop8Events();
	
	public List<GroupMainBean> getTop8Groups();
	
	public List<GroupPostBean> getTop8GroupPosts();
	
	public NotificationBean addnotification(Integer memberId, String notificationContent, String notificationDate, Boolean isRead);
}
