package com.joooin.repository.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.joooin.model.NotificationBean;
import com.joooin.repository.NotificationDao;

@Repository
public class NotificationDaoImpl implements NotificationDao{
	@Autowired
	SessionFactory factory;
	
	@Override
	public NotificationBean getByNotificationId(Integer notificationId) {
		Session session = factory.getCurrentSession();
		return session.get(NotificationBean.class, notificationId);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<NotificationBean> getAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM NotificationBean";
		return session.createQuery(hql).getResultList();
	}

	@Override
	public Integer save(NotificationBean notificationBean) {
		Session session = factory.getCurrentSession();
		return (Integer)session.save(notificationBean);
	}

	@Override
	public void update(NotificationBean notificationBean) {
		Session session = factory.getCurrentSession();
		session.update(notificationBean);
	}

	@Override
	public void deleteByNotificationId(Integer notificationId) {
		Session session = factory.getCurrentSession();
		session.delete(session.get(NotificationBean.class, notificationId));
	}

	@Override
	public void setAllIsReadTrueByMemberId(Integer memberId) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE NotificationBean n SET n.isRead = 1 WHERE n.memberId = :memberId";
		session.createQuery(hql).setParameter("memberId", memberId).executeUpdate();
	}
	
	
}
