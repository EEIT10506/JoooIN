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
	EventMainDao eventmaindao;
	@Autowired
	EventMemberDao eventmemberdao;
	@Autowired
	EventTypeDao eventtypedao;
	@Autowired
	MemberMainDao membermaindao;
	@Autowired
	EventPostDao eventPostDao;
	
	public EventMainBean getByEventMainId(Integer eventId) {
//		EventMainBean event = eventmaindao.getByEventMainId(eventId);
//		Integer typeid = event.getEventTypeId();
//		Integer inviterid = event.getEventInviterId();
//		
//		EventTypeBean eventtype = eventtypedao.getByEventTypeId(typeid);
//		MemberMainBean eventbuildname = membermaindao.getByMemberId(inviterid);
//		
//		Set<EventMemberBean> eventmember = event.getEventMemberSet();
//		
//		MemberMainBean eventmembers = null;
//		Set<MemberMainBean> eventmemberset =new HashSet<MemberMainBean>();
//		for(EventMemberBean members: eventmember) {
//			Integer memberid = members.getMemberId();
//			 eventmembers  = membermaindao.getByMemberId(memberid);
//			 eventmemberset.add(eventmembers);
//		}
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
		
		return eventmemberdao.save(eventMemberBean);
	}

	
	
		
}
