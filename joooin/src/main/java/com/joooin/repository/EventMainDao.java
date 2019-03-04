package com.joooin.repository;

import java.util.List;
import com.joooin.model.EventMainBean;

public interface EventMainDao {
	public EventMainBean getByEventMainId(Integer eventId);
	public List<EventMainBean> getAll();
	public Integer save(EventMainBean eventMainBean);
	public void update(EventMainBean eventMainBean);
	public void deleteByEventId(Integer eventId);
}


