package com.joooin.system.event._02.service;

import java.util.List;

import com.joooin.model.EventMainBean;
import com.joooin.model.EventMemberBean;
import com.joooin.model.EventTypeBean;
import com.joooin.model.MemberMainBean;

public interface EventService {
//	活動
	public EventMainBean getByEventMainId(Integer eventId);
	public List<EventMainBean> getAll();
	public Integer save(EventMainBean eventMainBean);
	public void update(EventMainBean eventMainBean);
	public void deleteByEventId(Integer eventId);
//	活動成員Bean
	public EventMemberBean getByEventMemberId(Integer eventMemberId);
	public List<EventMemberBean> getAllEventMembers();
	public Integer save(EventMemberBean eventMemberBean);
	public void update(EventMemberBean eventMemberBean);
	public void deleteByEventMemberId(Integer eventMemberId);
	//活動類型	
	public EventTypeBean getByEventTypeId(Integer eventTypeId);
	//member_main抓活動成員名單 
	public List<MemberMainBean> getAllEventMember();
	public MemberMainBean getByMemberId(Integer memberId);
}
