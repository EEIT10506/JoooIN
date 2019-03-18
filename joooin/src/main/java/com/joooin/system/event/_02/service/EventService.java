package com.joooin.system.event._02.service;

import java.util.List;

import javax.servlet.ServletContext;

import com.joooin.model.EventMainBean;
import com.joooin.model.EventMemberBean;
import com.joooin.model.EventPostBean;
import com.joooin.model.EventTypeBean;
import com.joooin.model.MemberMainBean;

public interface EventService {
//	活動
	public EventMainBean getByEventMainId(Integer eventId);
	public List<EventMainBean> getAll();
	public Integer save(EventMainBean eventMainBean);
	public Boolean updateEvent(Integer eventId,EventMainBean eventMainBean, ServletContext context);
	public void updateQuantityWhenOut(EventMainBean eventMainBean);
	public void deleteByEventId(Integer eventId);
//	活動成員Bean
	public EventMemberBean getByEventMemberId(Integer eventMemberId);
	public Integer saveEventMember(EventMemberBean eventMemberBean);
	//isAgreed--->true
	public void updateIsAgreed(EventMemberBean eventMemberBean);
	//活動類型	
	public EventTypeBean getByEventTypeId(Integer eventTypeId);
	//member_main抓活動成員名單 
	public List<MemberMainBean> getAllEventMember();
	public MemberMainBean getByMemberId(Integer memberId);
	//新增一筆留言
	public Integer saveOneEventPost(EventPostBean eventPostBean);
	//刪除一筆留言
	public void deleteEventPost(Integer eventPostId);
	public EventPostBean getByEventPostId(Integer eventPostId);
	public void updateEventPostIsDeleted(EventPostBean eventPostBean);
	//刪除一筆報名
	public void deleteEventMemberById(Integer eventId,Integer memberId);
	public void rejectSignUp(Integer eventMemberId);
	
}
