package com.joooin.repository;

import java.util.List;
import com.joooin.model.NotificationBean;

public interface NotificationDao {
	public NotificationBean getByNotificationId(Integer notificationId);
	public List<NotificationBean> getAll();
	public Integer save(NotificationBean notificationBean);
	public void update(NotificationBean notificationBean);
	public void deleteByNotificationId(Integer notificationId);
}


