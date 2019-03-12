package com.joooin.system.event._35.service;

import java.util.List;

import com.joooin.model.EventTypeBean;

public interface EventTypeService {
	public EventTypeBean getByEventTypeId(Integer eventTypeId);
	public List<EventTypeBean> getAll();
	public Integer save(EventTypeBean eventTypeBean);
	public void update(EventTypeBean eventTypeBean);
	public void deleteByEventTypeId(Integer eventTypeId);

}
