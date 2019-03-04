package com.joooin.repository;

import java.util.List;
import com.joooin.model.EventTypeBean;

public interface EventTypeDao {
	public EventTypeBean getByEventTypeId(Integer eventTypeId);
	public List<EventTypeBean> getAll();
	public Integer save(EventTypeBean eventTypeBean);
	public void update(EventTypeBean eventTypeBean);
	public void deleteByEventTypeId(Integer eventTypeId);
}


