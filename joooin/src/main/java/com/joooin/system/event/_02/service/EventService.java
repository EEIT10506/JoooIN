package com.joooin.system.event._02.service;

import java.util.List;

import com.joooin.model.EventMainBean;

public interface EventService {
	public EventMainBean getByEventMainId(Integer eventId);
	public List<EventMainBean> getAll();
	public Integer save(EventMainBean eventMainBean);
	public void update(EventMainBean eventMainBean);
	public void deleteByEventId(Integer eventId);
	
		
}
