package com.joooin.repository;

import java.util.List;

import com.joooin.model.EventMainBean;
import com.joooin.system.admin._03.model.AllEventQuantityBean;

public interface EventMainDao {
	public EventMainBean getByEventMainId(Integer eventId);
	public List<EventMainBean> getAll();
	public Integer save(EventMainBean eventMainBean);
	public void update(EventMainBean eventMainBean);
	public void deleteByEventId(Integer eventId);
	public List<AllEventQuantityBean> getAllEventQuantity();
}


