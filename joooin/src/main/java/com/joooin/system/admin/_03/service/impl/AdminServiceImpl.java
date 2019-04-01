package com.joooin.system.admin._03.service.impl;

import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.joooin.model.EventLikeBean;
import com.joooin.model.EventMainBean;
import com.joooin.model.EventMemberBean;
import com.joooin.model.EventPostBean;
import com.joooin.model.GroupChatBean;
import com.joooin.model.GroupMainBean;
import com.joooin.model.GroupMemberBean;
import com.joooin.model.MemberMainBean;
import com.joooin.repository.EventLikeDao;
import com.joooin.repository.EventMainDao;
import com.joooin.repository.EventMemberDao;
import com.joooin.repository.EventPostDao;
import com.joooin.repository.GroupChatDao;
import com.joooin.repository.GroupMainDao;
import com.joooin.repository.GroupMemberDao;
import com.joooin.repository.GroupPostDao;
import com.joooin.repository.GroupPostLikeDao;
import com.joooin.repository.GroupPostReplyDao;
import com.joooin.repository.MemberMainDao;
import com.joooin.system.admin._03.model.EventMainPojo;
import com.joooin.system.admin._03.model.GroupMainPojo;
import com.joooin.system.admin._03.model.MemberMainPojo;
import com.joooin.system.admin._03.service.AdminService;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	MemberMainDao mmd;
	
	@Autowired
	EventPostDao epd;
	
	@Autowired
	GroupMainDao gmd;
	
	@Autowired
	EventMainDao emd;
	
	@Autowired
	GroupMemberDao gmemberd;
	
	@Autowired
	EventMemberDao ememberd;
	
	@Autowired
	EventLikeDao eld;
	
	@Autowired
	GroupChatDao gcd;
	
	@Autowired
	GroupPostReplyDao gprd;
	
	@Autowired
	GroupPostLikeDao gpld;
	
	@Autowired
	GroupPostDao gpd;
	
	@Override
	public List<MemberMainBean> getAllMember() {
		return mmd.getAll();
	}

	@Override
	public List<GroupMainBean> getAllGroup() {
		return gmd.getAll();
	}

	@Override
	public List<EventMainBean> getAllEvent() {
		return emd.getAll();
	}

	@Override
	public MemberMainBean getMemberBean(Integer memberId) {
		return mmd.getByMemberId(memberId);
	}

	@Override
	public void deleteMemberBean(Integer memberId) {
		mmd.deleteByMemberId(memberId);
	}
	
	@Override
	public GroupMainBean getGroupBean(Integer groupId) {
		return gmd.getByGroupId(groupId);
	}

	@Override
	public void deleteGroupBean(Integer groupId) {
		gmd.deleteByGroupId(groupId);
	}

	@Override
	public void deleteGroupMemberBean(Integer groupId) {
		List<GroupMemberBean> list = gmemberd.getAll();
		for(GroupMemberBean gmemberb : list) {
			if(gmemberb.getGroupId().equals(groupId));
			gmemberd.deleteByGroupMemberId(gmemberb.getGroupMemberId());
		}
	}

	@Override
	public void deleteGroupChat(Integer groupId) {
		List<GroupChatBean> list = gcd.getAll();
		for(GroupChatBean gcb : list) {
			if(gcb.getGroupId().equals(groupId));
			gcd.deleteByGroupChatId(gcb.getGroupChatId());
		}
	}

	@Override
	public EventMainBean getEventBean(Integer eventId) {
		return emd.getByEventMainId(eventId);
	}

	@Override
	public void deleteEventBean(Integer eventId) {
		emd.deleteByEventId(eventId);
	}

	@Override
	public void deleteEventMemberBean(Integer eventId) {
		List<EventMemberBean> list = ememberd.getAll();
		for(EventMemberBean ememberb : list) {
			if(ememberb.getEventId().equals(eventId));
			ememberd.deleteByEventMemberId(ememberb.getEventMemberId());
		}
	}
	
	@Override
	public void deleteEventLike(Integer eventId) {
		List<EventLikeBean> list = eld.getAll();
		for(EventLikeBean elb : list) {
			if(elb.getEventId().equals(eventId));
			eld.deleteByEventLikeId(elb.getEventLikeId());
		}
	}

	@Override
	public void deleteEventPost(Integer eventId) {
		List<EventPostBean> list = epd.getAll();
		for(EventPostBean epb : list) {
			if(epb.getEventId().equals(eventId));
			epd.deleteByEventPostId(epb.getEventPostId());
		}
	}

	@Override
	public void putMember(MemberMainBean mmb) {
		mmd.update(mmb);
	}

	@Override
	public List<MemberMainPojo> getAllMembers() {
		
		List<MemberMainPojo> pojoList = new LinkedList<MemberMainPojo>();
		
		for(MemberMainBean list : mmd.getAll()) {
			MemberMainPojo memberPojo = new MemberMainPojo();
			memberPojo.setMemberId(list.getMemberId());
			memberPojo.setMemberName(list.getMemberName());
			memberPojo.setEmail(list.getEmail());
			memberPojo.setGender(list.getGender());
			memberPojo.setLogins(list.getLogins());
			memberPojo.setMemberCreateDate(list.getMemberCreateDate());
			memberPojo.setCertificationStatus(list.getCertificationStatus());
			pojoList.add(memberPojo);
		}
		
		
		
		return pojoList;
	}

	@Override
	public List<GroupMainPojo> getAllGroups() {
		
		List<GroupMainPojo> pojoList = new LinkedList<GroupMainPojo>();
		
		for(GroupMainBean list : gmd.getAll()) {
			GroupMainPojo groupPojo = new GroupMainPojo();
			groupPojo.setGroupId(list.getGroupId());
			groupPojo.setGroupType(list.getGroupType());
			groupPojo.setGroupName(list.getGroupName());
			groupPojo.setGroupLeaderId(list.getGroupLeaderId());
			groupPojo.setGroupCreateDate(list.getGroupCreateDate());
			groupPojo.setGroupCurrentMembers(list.getGroupCurrentMembers());
			
			pojoList.add(groupPojo);
		}
		
		return pojoList;
	}

	@Override
	public List<EventMainPojo> getAllEvents() {
		
		List<EventMainPojo> pojoList = new LinkedList<EventMainPojo>();
		for(EventMainBean list : emd.getAll()) {
			EventMainPojo eventPojo = new EventMainPojo();
			eventPojo.setEventId(list.getEventId());
			eventPojo.setEventName(list.getEventName());
			eventPojo.setEventAddress(list.getEventAddress());
			eventPojo.setEventTypeId(list.getEventTypeId());
			eventPojo.setEventCurrentMembers(list.getEventCurrentMembers());
			
			pojoList.add(eventPojo);
		}
		return pojoList;
	}


}
