package com.joooin.system.admin._03.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.joooin.model.EventMainBean;
import com.joooin.model.EventMemberBean;
import com.joooin.model.GroupMainBean;
import com.joooin.model.GroupMemberBean;
import com.joooin.model.MemberMainBean;
import com.joooin.repository.EventMainDao;
import com.joooin.repository.EventMemberDao;
import com.joooin.repository.GroupMainDao;
import com.joooin.repository.GroupMemberDao;
import com.joooin.repository.MemberMainDao;
import com.joooin.system.admin._03.service.AdminService;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	MemberMainDao mmd;
	
	@Autowired
	GroupMainDao gmd;
	
	@Autowired
	EventMainDao emd;
	
	@Autowired
	GroupMemberDao gmemberd;
	
	@Autowired
	EventMemberDao ememberd;

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
	public GroupMemberBean getGroupMemberBean(Integer groupId) {
		return gmemberd.getByGroupMemberId(groupId);
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
	public EventMainBean getEventBean(Integer eventId) {
		return emd.getByEventMainId(eventId);
	}

	@Override
	public void deleteEventBean(Integer eventId) {
		emd.deleteByEventId(eventId);
	}

	@Override
	public EventMemberBean getEventMemberBean(Integer eventId) {
		return ememberd.getByEventMemberId(eventId);
	}

	@Override
	public void deleteEventMemberBean(Integer eventId) {
		List<EventMemberBean> list = ememberd.getAll();
		for(EventMemberBean ememberb : list) {
			if(ememberb.getEventId().equals(eventId));
			ememberd.deleteByEventMemberId(ememberb.getEventMemberId());
		}
	}

	

}
