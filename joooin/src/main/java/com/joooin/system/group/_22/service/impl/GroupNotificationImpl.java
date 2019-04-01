package com.joooin.system.group._22.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joooin.model.NotificationBean;
import com.joooin.repository.GroupMainDao;
import com.joooin.repository.NotificationDao;
import com.joooin.system.group._22.service.GroupNotification;


@Transactional
@Service
public class GroupNotificationImpl implements GroupNotification {

	@Autowired
	NotificationDao notifDao;
	@Autowired
	GroupMainDao groupMainDao;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");	
	
	@Override
	public void groupNotifJoined(Integer selfId, Integer groupId) {
		NotificationBean notif = new NotificationBean();
		notif.setMemberId(selfId);
		String content = "group_joined_groupId=" + groupId;
		notif.setNotificationContent(content);
		notif.setNotificationDate(sdf.format(new Date()).toString());
		notif.setIsRead(false);
		notifDao.save(notif);
	}

	@Override
	public void groupNotifReject(Integer selfId, Integer groupId) {
		NotificationBean notif = new NotificationBean();
		notif.setMemberId(selfId);
		String content = "group_reject_groupId=" + groupId;
		notif.setNotificationContent(content);
		notif.setNotificationDate(sdf.format(new Date()).toString());
		notif.setIsRead(false);
		notifDao.save(notif);
	}

	@Override
	public void groupNotifRequest(Integer groupId) {
		NotificationBean notif = new NotificationBean();
		notif.setMemberId(groupMainDao.getByGroupId(groupId).getGroupLeaderId());
		String content = "group_request_groupId=" + groupId;
		notif.setNotificationContent(content);
		notif.setNotificationDate(sdf.format(new Date()).toString());
		notif.setIsRead(false);
		notifDao.save(notif);
	}

}
