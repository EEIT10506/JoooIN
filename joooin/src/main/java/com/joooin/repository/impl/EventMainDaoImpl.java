package com.joooin.repository.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.joooin.model.EventMainBean;
import com.joooin.repository.EventMainDao;

@Repository
public class EventMainDaoImpl implements EventMainDao{
	@Autowired
	SessionFactory factory;
	
	@Override
	public EventMainBean getByEventMainId(Integer eventId) {
		Session session = factory.getCurrentSession();
		return session.get(EventMainBean.class, eventId);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<EventMainBean> getAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM EventMainBean";
		return session.createQuery(hql).getResultList();
	}

	@Override
	public Integer save(EventMainBean eventMainBean) {
		Session session = factory.getCurrentSession();
		return (Integer)session.save(eventMainBean);
	}

	@Override
	public void update(EventMainBean eventMainBean) {
		Session session = factory.getCurrentSession();
		session.update(eventMainBean);
	}

	@Override
	public void deleteByEventId(Integer eventId) {
		Session session = factory.getCurrentSession();
		session.delete(session.get(EventMainBean.class, eventId));
	}
	
	
}
