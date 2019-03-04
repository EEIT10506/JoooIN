package com.joooin.repository;

import java.util.List;
import com.joooin.model.EventLikeBean;

public interface EventLikeDao {
	public EventLikeBean getByEventLikeId(Integer eventLikeId);
	public List<EventLikeBean> getAll();
	public Integer save(EventLikeBean eventLikeBean);
	public void update(EventLikeBean eventLikeBean);
	public void deleteByEventLikeId(Integer eventLikeId);
}


