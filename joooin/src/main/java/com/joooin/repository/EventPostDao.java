package com.joooin.repository;

import java.util.List;
import com.joooin.model.EventPostBean;

public interface EventPostDao {
	public EventPostBean getByEventPostId(Integer eventPostId);
	public List<EventPostBean> getAll();
	public Integer save(EventPostBean eventPostBean);
	public void update(EventPostBean eventPostBean);
	public void deleteByEventPostId(Integer eventPostId);
}


