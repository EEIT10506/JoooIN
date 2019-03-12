package com.joooin.system.event._35.service.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.joooin.model.EventMemberBean;
import com.joooin.repository.EventMemberDao;
import com.joooin.system.event._35.service.EventMemberService;

@Service
@Transactional
public class EventMemberServiceImpl implements EventMemberService {

	@Autowired
	SessionFactory factory;
	
	@Autowired
	EventMemberDao eventmemberDao;
	
	@Override
	public EventMemberBean getByEventMemberId(Integer eventMemberId) {
		
		return eventmemberDao.getByEventMemberId(eventMemberId);
	}

	@Override
	public List<EventMemberBean> getAll() {
		
		return eventmemberDao.getAll();
	}

	@Override
	public Integer save(EventMemberBean eventMemberBean) {
		
		return eventmemberDao.save(eventMemberBean);
	}

	@Override
	public void update(EventMemberBean eventMemberBean) {
		eventmemberDao.update(eventMemberBean);

	}

	@Override
	public void deleteByEventMemberId(Integer eventMemberId) {
		eventmemberDao.deleteByEventMemberId(eventMemberId);

	}

}
