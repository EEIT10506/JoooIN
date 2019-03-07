package com.joooin.system.event._02.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.joooin.model.EventMainBean;
import com.joooin.model.EventMemberBean;
import com.joooin.model.EventTypeBean;
import com.joooin.model.MemberMainBean;
import com.joooin.repository.EventMainDao;
import com.joooin.repository.EventMemberDao;
import com.joooin.repository.EventTypeDao;
import com.joooin.repository.MemberMainDao;
import com.joooin.system.event._02.service.EventService;
@Service
@Transactional
public class EventServiceImpl implements EventService {
	
	@Autowired
	EventMainDao eventmaindao;
	@Autowired
	EventMemberDao eventmemberdao;
	@Autowired
	EventTypeDao eventtypedao;
	@Autowired
	MemberMainDao membermaindao;
	public EventMainBean getByEventMainId(Integer eventId) {
		return eventmaindao.getByEventMainId(eventId);
	}

	@Override
	public List<EventMainBean> getAll() {
		
		return null;
	}

	@Override
	public Integer save(EventMainBean eventMainBean) {
	
		return null;
	}

	@Override
	public void update(EventMainBean eventMainBean) {
	
		
	}

	@Override
	public void deleteByEventId(Integer eventId) {
	
		
	}

	@Override
	public EventMemberBean getByEventMemberId(Integer eventMemberId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<EventMemberBean> getAllEventMembers() {
		List<EventMemberBean> memberbean = eventmemberdao.getAll();
		return null;
	}

	@Override
	public Integer save(EventMemberBean eventMemberBean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(EventMemberBean eventMemberBean) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteByEventMemberId(Integer eventMemberId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public EventTypeBean getByEventTypeId(Integer eventTypeId) {
		
		return eventtypedao.getByEventTypeId(eventTypeId);
	}

	@Override
	public List<MemberMainBean> getAllEventMember() {
		
		return membermaindao.getAll();
	}

	@Override
	public MemberMainBean getByMemberId(Integer memberId) {
		// TODO Auto-generated method stub
		return membermaindao.getByMemberId(memberId);
	}
		
}
