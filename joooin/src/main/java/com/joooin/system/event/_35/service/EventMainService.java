package com.joooin.system.event._35.service;

import java.util.List;

import com.joooin.model.EventMainBean;

public interface EventMainService {
	public EventMainBean getByEventMainId(Integer eventId);
	public List<EventMainBean> getAll();
	public Integer save(EventMainBean eventMainBean);
	public void update(EventMainBean eventMainBean);
	public void deleteByEventId(Integer eventId);

}
