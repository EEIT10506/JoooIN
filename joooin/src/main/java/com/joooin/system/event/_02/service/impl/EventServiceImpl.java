package com.joooin.system.event._02.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.joooin.model.EventMainBean;
import com.joooin.model.EventMemberBean;
import com.joooin.model.EventPostBean;
import com.joooin.model.EventTypeBean;
import com.joooin.model.MemberMainBean;
import com.joooin.repository.EventMainDao;
import com.joooin.repository.EventMemberDao;
import com.joooin.repository.EventPostDao;
import com.joooin.repository.EventTypeDao;
import com.joooin.repository.MemberMainDao;
import com.joooin.system.event._02.service.EventService;
@Service
@Transactional
public class EventServiceImpl implements EventService {
	
	@Autowired
	EventMainDao eventMainDao;
	@Autowired
	EventMemberDao eventMemberDao;
	@Autowired
	EventTypeDao eventTypeDao;
	@Autowired
	MemberMainDao memberMainDao;
	@Autowired
	EventPostDao eventPostDao;
	
	public EventMainBean getByEventMainId(Integer eventId) {

		return eventMainDao.getByEventMainId(eventId);
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
	public EventTypeBean getByEventTypeId(Integer eventTypeId) {
		
		return eventTypeDao.getByEventTypeId(eventTypeId);
	}

	@Override
	public List<MemberMainBean> getAllEventMember() {
		
		return memberMainDao.getAll();
	}

	@Override
	public MemberMainBean getByMemberId(Integer memberId) {
		// TODO Auto-generated method stub
		return memberMainDao.getByMemberId(memberId);
	}

	@Override
	public Integer saveOneEventPost(EventPostBean eventPostBean) {
		
		return eventPostDao.save(eventPostBean);
	}
	
	@Override
	public void deleteEventPost(Integer eventPostId) {
		
		eventPostDao.deleteByEventPostId(eventPostId);
	}

	@Override
	public Integer saveEventMember(EventMemberBean eventMemberBean) {
		
		return eventMemberDao.save(eventMemberBean);
	}
	@Override
	public void updateEventPostIsDeleted(EventPostBean eventPostBean) {
		eventPostDao.update(eventPostBean);
		
	}
	@Override
	public EventPostBean getByEventPostId(Integer eventPostId) {
		
		return eventPostDao.getByEventPostId(eventPostId);
	}
	@Override
	public void deleteEventMemberById(Integer eventId, Integer memberId) {
		List<EventMemberBean> list = eventMemberDao.getAll();
		
		for(EventMemberBean bean : list) {
		     if (bean.getEventId().equals(eventId) && bean.getMemberId().equals(memberId)) {
		    	 eventMemberDao.deleteByEventMemberId(bean.getEventMemberId());
		    	 break;
		     }
		}
	}
	@Override
	public EventMemberBean getByEventMemberId(Integer eventMemberId) {
		
		return eventMemberDao.getByEventMemberId(eventMemberId);
	}

	
	
		
}
