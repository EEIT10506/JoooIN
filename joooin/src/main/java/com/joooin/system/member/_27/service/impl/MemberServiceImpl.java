package com.joooin.system.member._27.service.impl;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joooin.model.EventLikeBean;
import com.joooin.model.EventMainBean;
import com.joooin.model.EventMemberBean;
import com.joooin.model.GroupMainBean;
import com.joooin.model.GroupMemberBean;
import com.joooin.model.MemberFriendBean;
import com.joooin.model.MemberMainBean;
import com.joooin.model.NotificationBean;
import com.joooin.repository.EventLikeDao;
import com.joooin.repository.EventMainDao;
import com.joooin.repository.EventMemberDao;
import com.joooin.repository.GroupMainDao;
import com.joooin.repository.GroupMemberDao;
import com.joooin.repository.MemberFriendDao;
import com.joooin.repository.MemberMainDao;
import com.joooin.repository.NotificationDao;
import com.joooin.system.member._27.pojo.FriendPojo;
import com.joooin.system.member._27.service.MemberService;
import com.joooin.system.member._27.service.MessageService;
import com.joooin.util.ImageUtils;

@Service
@Transactional
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberMainDao memberMainDao;
	@Autowired
	MemberFriendDao memberFriendDao;
	@Autowired
	EventMainDao eventMainDao;
	@Autowired
	EventMemberDao eventMemberDao;
	@Autowired
	EventLikeDao eventLikeDao;
	@Autowired
	GroupMainDao groupMainDao;
	@Autowired
	GroupMemberDao groupMemberDao;
	@Autowired
	MessageService messageService;
	@Autowired
	NotificationDao notificationDao;
	
	@Override
	public MemberMainBean getMemberMainBean(Integer memberId) {
		return memberMainDao.getByMemberId(memberId);
	}
	
	@Override
	public EventMainBean getEventMainBean(Integer eventId) {
		return eventMainDao.getByEventMainId(eventId);
	}
	
	@Override
	public GroupMainBean getGroupMainBean(Integer groupId) {
		return groupMainDao.getByGroupId(groupId);
	}
	
	@Override
	public String updateProfile(Integer memberId, MemberMainBean updateBean, ServletContext context) {
		MemberMainBean oldBean = memberMainDao.getByMemberId(memberId);
		oldBean.setMemberName(updateBean.getMemberName());
		oldBean.setBirthday(updateBean.getBirthday());
		oldBean.setCity(updateBean.getCity());
		oldBean.setPhone(updateBean.getPhone());
		
		Byte[] memberImage = null;
		if (!updateBean.getMultipartFile().isEmpty()) {
			memberImage = ImageUtils.multipartFileToByteArray(updateBean.getMultipartFile());
			oldBean.setMemberImage(memberImage);
		} 
		memberMainDao.update(oldBean);
		
		return oldBean.getMemberName();
	}

	@Override
	public void updatePassword(String password1, String password2, Integer memberId) {
		if (password1.equals(password2)) {
			MemberMainBean bean = memberMainDao.getByMemberId(memberId);
			bean.setPassword(password1);
			memberMainDao.update(bean);
		}
	}

	@Override
	public void updatePrivacy(Integer memberId, MemberMainBean updateBean) {
		MemberMainBean oldBean = memberMainDao.getByMemberId(memberId);
		oldBean.setGenderDisplay(updateBean.getGenderDisplay());
		oldBean.setBirthdayDisplay(updateBean.getBirthdayDisplay());
		oldBean.setCityDisplay(updateBean.getCityDisplay());
		oldBean.setEmailDisplay(updateBean.getEmailDisplay());
		oldBean.setPhoneDisplay(updateBean.getPhoneDisplay());
		memberMainDao.update(oldBean);
	}
	
	@Override
	public String checkFriendStatus(Integer inviteMemberId, Integer receiveMemberId) {
		List<MemberFriendBean> list = memberFriendDao.getListByMemberId(inviteMemberId);
		
		if (!list.isEmpty()) {
			for (MemberFriendBean bean : list) {
				if (bean.getReceiveMemberId().equals(receiveMemberId)) {
					if (bean.getIsFriend())
						return "FRIEND";
					else if (!bean.getIsFriend() && bean.getIsInviter())
						return "REQUEST";
					else 
						return "RECEIVE";
				} 
			}
			return "NOT_FRIEND";
		} else {
			return "NOT_FRIEND";
		}
	}

	@Override
	public void friendProcess(Integer inviteMemberId, Integer receiveMemberId, String process) {
		List<MemberFriendBean> list = memberFriendDao.getAll();
		
		if (process.equals("request")) {
			Boolean isRequested = false;
			
			for (MemberFriendBean bean : list) {
				if ((bean.getInviteMemberId().equals(inviteMemberId) && bean.getReceiveMemberId().equals(receiveMemberId))) {
					isRequested = true;
					break;
				}
			}
			if (!isRequested) {
				String hash = UUID.randomUUID().toString();
				memberFriendDao.save(new MemberFriendBean(inviteMemberId, receiveMemberId, false, true, hash));
				memberFriendDao.save(new MemberFriendBean(receiveMemberId, inviteMemberId, false, false, hash));
				
				Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				String newDate = sdf.format(date);
				
				NotificationBean bean = new NotificationBean(receiveMemberId, "friend_request_memberId=" + inviteMemberId.toString(), newDate, false);
				notificationDao.save(bean);
			}
		}
		
		if (process.equals("cancel") || process.equals("reject") || process.equals("delete")) {
			int breakPoint = 0;
			for (MemberFriendBean bean : list) {
				if ((bean.getInviteMemberId().equals(inviteMemberId) && bean.getReceiveMemberId().equals(receiveMemberId)) ||
					(bean.getInviteMemberId().equals(receiveMemberId) && bean.getReceiveMemberId().equals(inviteMemberId))) {
					memberFriendDao.deleteByMemberFriendId(bean.getMemberFriendId());
					breakPoint++;
					if (breakPoint == 2) break;
				}
			}
		}
		
		if (process.equals("agree")) {
			int breakPoint = 0;
			for (MemberFriendBean bean : list) {
				if ((bean.getInviteMemberId().equals(inviteMemberId) && bean.getReceiveMemberId().equals(receiveMemberId)) ||
					(bean.getInviteMemberId().equals(receiveMemberId) && bean.getReceiveMemberId().equals(inviteMemberId))) {
					bean.setIsFriend(true);
					memberFriendDao.update(bean);
					breakPoint++;
					
					if (breakPoint == 1) {
						Date date = new Date();
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
						String newDate = sdf.format(date);
						
						NotificationBean notiBean = new NotificationBean(receiveMemberId, "friend_accepted_memberId=" + inviteMemberId.toString(), newDate, false);
						notificationDao.save(notiBean);	
					}
					if (breakPoint == 2) break;
				}
			}
		}
	}

	@Override
	public List<FriendPojo> getFriendsOnFriendPage(Integer memberId) {
		List<MemberFriendBean> memberFriendList = memberFriendDao.getAll();
		List<FriendPojo> friendPojoList = new ArrayList<FriendPojo>();
		
		for (MemberFriendBean bean : memberFriendList) {
			if (bean.getInviteMemberId().equals(memberId)) {
				FriendPojo pojo = new FriendPojo();
				pojo.setMemberId(bean.getReceiveMemberId());
				pojo.setMemberName(memberMainDao.getByMemberId(bean.getReceiveMemberId()).getMemberName());
				pojo.setIsFriend(bean.getIsFriend());
				pojo.setIsInviter(bean.getIsInviter());
				pojo.setMessageHash(bean.getMessageHash());
				friendPojoList.add(pojo);
			}
		}
		return friendPojoList;
	}

	
	
	
	@Override
	public List<EventMainBean> getOtherEvents(Integer memberId) {
		List<EventMemberBean> eventMemberlist = eventMemberDao.getAll();
		List<EventMainBean> eventMainlist = new ArrayList<EventMainBean>();
		
		for (EventMemberBean bean : eventMemberlist) {
			if (bean.getMemberId().equals(memberId) && bean.getIsAgreed()) 
				eventMainlist.add(eventMainDao.getByEventMainId(bean.getEventId()));
		}
		return eventMainlist;
	}

	@Override
	public List<EventMainBean> getEvents(Integer memberId, String process)  {
		if (process.equals("my_event")) {
			List<EventMainBean> eventMainList = eventMainDao.getAll();
			List<EventMainBean> list = new ArrayList<EventMainBean>();
			
			for (EventMainBean bean : eventMainList) {
				if (bean.getEventInviterId().equals(memberId)) 
					list.add(bean);
			}
			return list;
		}
		if (process.equals("joined_event")) {
			List<EventMemberBean> eventMemberlist = eventMemberDao.getAll();
			List<EventMainBean> eventMainlist = new ArrayList<EventMainBean>();
			
			for (EventMemberBean bean : eventMemberlist) {
				if (bean.getMemberId().equals(memberId) && bean.getIsAgreed() && 
					!eventMainDao.getByEventMainId(bean.getEventId()).getEventInviterId().equals(memberId)) {
					eventMainlist.add(eventMainDao.getByEventMainId(bean.getEventId()));
				}
			}
			return eventMainlist;
		}
		if (process.equals("request_event")) {
			List<EventMemberBean> eventMemberlist = eventMemberDao.getAll();
			List<EventMainBean> eventMainlist = new ArrayList<EventMainBean>();
			
			for (EventMemberBean bean : eventMemberlist) {
				if (bean.getMemberId().equals(memberId) && !bean.getIsAgreed()) 
					eventMainlist.add(eventMainDao.getByEventMainId(bean.getEventId()));
			}
			return eventMainlist;
		}
		if (process.equals("like_event")) {
			List<EventLikeBean> eventLikeList = eventLikeDao.getAll();
			List<EventMainBean> eventMainList = new ArrayList<EventMainBean>();
			
			for (EventLikeBean bean : eventLikeList) {
				if (bean.getMemberId().equals(memberId)) 
					eventMainList.add(eventMainDao.getByEventMainId(bean.getEventId()));
			}
			return eventMainList;
		}
		return null;
	}

	@Override
	public synchronized void deleteEvent(Integer memberId, Integer eventId) {
		List<EventMemberBean> list = eventMemberDao.getAll();
		Integer quantity = null;
		
		for (EventMemberBean eventMemberBean : list) {
			if (eventMemberBean.getMemberId().equals(memberId) && eventMemberBean.getEventId().equals(eventId) &&
				eventMemberBean.getIsAgreed()) {
				quantity = eventMemberBean.getQuantity();
				EventMainBean eventMainBean = eventMainDao.getByEventMainId(eventId);
				eventMainBean.setEventCurrentMembers(eventMainBean.getEventCurrentMembers() - quantity);
				eventMainDao.update(eventMainBean);
				eventMemberDao.deleteByEventMemberId(eventMemberBean.getEventMemberId());
			}
		}
	}

	@Override
	public void cancelEvent(Integer memberId, Integer eventId) {
		List<EventMemberBean> list = eventMemberDao.getAll();
		
		for (EventMemberBean bean : list) {
			if (bean.getMemberId().equals(memberId) && bean.getEventId().equals(eventId) && !bean.getIsAgreed()) 
				eventMemberDao.deleteByEventMemberId(bean.getEventMemberId());
		}
	}

	@Override
	public synchronized void noLikeEvent(Integer memberId, Integer eventId) {
		List<EventLikeBean> list = eventLikeDao.getAll();
		
		for (EventLikeBean eventLikeBean : list) {
			if (eventLikeBean.getMemberId().equals(memberId) && eventLikeBean.getEventId().equals(eventId)) {
				EventMainBean eventMainBean = eventMainDao.getByEventMainId(eventId);
				eventMainBean.setEventLike(eventMainBean.getEventLike() - 1);
				eventMainDao.update(eventMainBean);
				eventLikeDao.deleteByEventLikeId(eventLikeBean.getEventLikeId());
			}
		}
	}
	
	@Override
	public List<GroupMainBean> getOtherGroups(Integer memberId) {
		List<GroupMemberBean> groupMemberlist = groupMemberDao.getAll();
		List<GroupMainBean> groupMainList = new ArrayList<GroupMainBean>();

		for (GroupMemberBean bean : groupMemberlist) {
			if (bean.getMemberId().equals(memberId) && bean.getIsAgreed()) 
				groupMainList.add(groupMainDao.getByGroupId(bean.getGroupId()));
		}
		return groupMainList;
	}

	@Override
	public List<GroupMainBean> getGroups(Integer memberId, String process) {
		if (process.equals("my_group")) {
			List<GroupMainBean> listAll = groupMainDao.getAll();
			List<GroupMainBean> list = new ArrayList<GroupMainBean>();
			
			for (GroupMainBean bean : listAll) {
				if (bean.getGroupLeaderId().equals(memberId)) 
					list.add(bean);
			}
			return list;
		}
		
		if (process.equals("joined_group")) {
			List<GroupMemberBean> groupMemberlist = groupMemberDao.getAll();
			List<GroupMainBean> groupMainList = new ArrayList<GroupMainBean>();
			
			for (GroupMemberBean bean : groupMemberlist) {
				if (bean.getMemberId().equals(memberId) && bean.getIsAgreed() &&
					!groupMainDao.getByGroupId(bean.getGroupId()).getGroupLeaderId().equals(memberId)) 
					groupMainList.add(groupMainDao.getByGroupId(bean.getGroupId()));
			}
			return groupMainList;
		}
		
		if (process.equals("request_group")) {
			List<GroupMemberBean> groupMemberlist = groupMemberDao.getAll();
			List<GroupMainBean> groupMainList = new ArrayList<GroupMainBean>();
			
			for (GroupMemberBean bean : groupMemberlist) {
				if (bean.getMemberId().equals(memberId) && !bean.getIsAgreed()) 
					groupMainList.add(groupMainDao.getByGroupId(bean.getGroupId()));
			}
			return groupMainList;
		}
		return null;
	}

	@Override
	public synchronized void deleteGroup(Integer memberId, Integer groupId) {
		List<GroupMemberBean> list = groupMemberDao.getAll();
		
		for (GroupMemberBean groupMemberBean : list) {
			if (groupMemberBean.getMemberId().equals(memberId) && groupMemberBean.getGroupId().equals(groupId) && 
				groupMemberBean.getIsAgreed()) {
				GroupMainBean groupMainBean = groupMainDao.getByGroupId(groupId);
				Integer quantity = groupMainBean.getGroupCurrentMembers();
				groupMainBean.setGroupCurrentMembers(quantity - 1);
				groupMainDao.update(groupMainBean);
				groupMemberDao.deleteByGroupMemberId(groupMemberBean.getGroupMemberId());
			}
		}
	}

	@Override
	public void cancelGroup(Integer memberId, Integer groupId) {
		List<GroupMemberBean> list = groupMemberDao.getAll();
		
		for (GroupMemberBean bean : list) {
			if (bean.getMemberId().equals(memberId) && bean.getGroupId().equals(groupId)) 
				groupMemberDao.deleteByGroupMemberId(bean.getGroupMemberId());
		}
	}

	@Override
	public void modifyIntro(Integer memberId, String memberIntro) {
		MemberMainBean bean = memberMainDao.getByMemberId(memberId);
		bean.setMemberIntro(memberIntro.replace("\n", "<br />"));
		memberMainDao.update(bean);
	}
	
	

}
