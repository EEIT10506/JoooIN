package com.joooin.system.admin._03.service;

import java.util.List;

import com.joooin.model.EventMainBean;
import com.joooin.model.GroupMainBean;
import com.joooin.model.MemberMainBean;
import com.joooin.system.admin._03.model.EventMainPojo;
import com.joooin.system.admin._03.model.GroupMainPojo;
import com.joooin.system.admin._03.model.MemberMainPojo;

public interface AdminService {
	public List<MemberMainBean> getAllMember();
	public List<GroupMainBean> getAllGroup();
	public List<EventMainBean> getAllEvent();
	public MemberMainBean getMemberBean(Integer memberId);
	public void deleteMemberBean(Integer memberId);
	public GroupMainBean getGroupBean(Integer groupId);
	public void deleteGroupBean(Integer groupId);
	public void deleteGroupMemberBean(Integer groupId);
	public void deleteGroupChat(Integer groupId);
	public EventMainBean getEventBean(Integer eventId);
	public void deleteEventBean(Integer eventId);
	public void deleteEventMemberBean(Integer eventId);
	public void deleteEventLike(Integer eventId);
	public void deleteEventPost(Integer eventId);
	public void putMember(MemberMainBean mmb);
	public List<MemberMainPojo> getAllMembers();
	public List<GroupMainPojo> getAllGroups();
	public List<EventMainPojo> getAllEvents();

}
