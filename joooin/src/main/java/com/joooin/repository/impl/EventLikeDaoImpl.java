package com.joooin.repository.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.joooin.model.EventLikeBean;
import com.joooin.repository.EventLikeDao;

@Repository
public class EventLikeDaoImpl implements EventLikeDao{
	@Autowired
	SessionFactory factory;
	
	@Override
	public EventLikeBean getByEventLikeId(Integer eventLikeId) {
		Session session = factory.getCurrentSession();
		return session.get(EventLikeBean.class, eventLikeId);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<EventLikeBean> getAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM EventLikeBean";
		return session.createQuery(hql).getResultList();
	}

	@Override
	public Integer save(EventLikeBean eventLikeBean) {
		Session session = factory.getCurrentSession();
		return (Integer)session.save(eventLikeBean);
	}

	@Override
	public void update(EventLikeBean eventLikeBean) {
		Session session = factory.getCurrentSession();
		session.update(eventLikeBean);
	}

	@Override
	public void deleteByEventLikeId(Integer eventLikeId) {
		Session session = factory.getCurrentSession();
		session.delete(session.get(EventLikeBean.class, eventLikeId));
	}
	
	
}
