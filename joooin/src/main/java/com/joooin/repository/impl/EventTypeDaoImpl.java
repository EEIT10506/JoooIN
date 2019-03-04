package com.joooin.repository.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.joooin.model.EventTypeBean;
import com.joooin.repository.EventTypeDao;

@Repository
public class EventTypeDaoImpl implements EventTypeDao{
	@Autowired
	SessionFactory factory;
	
	@Override
	public EventTypeBean getByEventTypeId(Integer eventTypeId) {
		Session session = factory.getCurrentSession();
		return session.get(EventTypeBean.class, eventTypeId);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<EventTypeBean> getAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM EventTypeBean";
		return session.createQuery(hql).getResultList();
	}

	@Override
	public Integer save(EventTypeBean eventTypeBean) {
		Session session = factory.getCurrentSession();
		return (Integer)session.save(eventTypeBean);
	}

	@Override
	public void update(EventTypeBean eventTypeBean) {
		Session session = factory.getCurrentSession();
		session.update(eventTypeBean);
	}

	@Override
	public void deleteByEventTypeId(Integer eventTypeId) {
		Session session = factory.getCurrentSession();
		session.delete(session.get(EventTypeBean.class, eventTypeId));
	}
	
	
}
