package com.joooin.repository;

import java.util.List;
import com.joooin.model.EventMemberBean;

public interface EventMemberDao {
	public EventMemberBean getByEventMemberId(Integer eventMemberId);
	public List<EventMemberBean> getAll();
	public Integer save(EventMemberBean eventMemberBean);
	public void update(EventMemberBean eventMemberBean);
	public void deleteByEventMemberId(Integer eventMemberId);
}


