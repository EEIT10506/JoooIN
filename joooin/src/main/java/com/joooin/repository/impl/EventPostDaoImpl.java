package com.joooin.repository.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.joooin.model.EventPostBean;
import com.joooin.repository.EventPostDao;

@Repository
public class EventPostDaoImpl implements EventPostDao{
	@Autowired
	SessionFactory factory;
	
	@Override
	public EventPostBean getByEventPostId(Integer eventPostId) {
		Session session = factory.getCurrentSession();
		return session.get(EventPostBean.class, eventPostId);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<EventPostBean> getAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM EventPostBean";
		return session.createQuery(hql).getResultList();
	}

	@Override
	public Integer save(EventPostBean eventPostBean) {
		Session session = factory.getCurrentSession();
		return (Integer)session.save(eventPostBean);
	}

	@Override
	public void update(EventPostBean eventPostBean) {
		Session session = factory.getCurrentSession();
		session.update(eventPostBean);
	}

	@Override
	public void deleteByEventPostId(Integer eventPostId) {
		Session session = factory.getCurrentSession();
		session.delete(session.get(EventPostBean.class, eventPostId));
	}
	
	
}
