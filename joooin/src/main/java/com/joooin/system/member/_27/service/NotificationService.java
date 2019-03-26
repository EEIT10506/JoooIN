package com.joooin.system.member._27.service;

import java.util.List;

import com.joooin.system.member._27.pojo.NotificationPojo;

public interface NotificationService {
	public List<NotificationPojo> getNotifications(Integer memberId);
	public Integer getNotiNotReadQuantity(Integer memberId);
	public void setOneNotificationRead(Integer notificationId);
	public void setAllNotificationsRead(Integer memberId);
}
