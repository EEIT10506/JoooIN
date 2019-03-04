package com.joooin.repository.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.joooin.model.EventMemberBean;
import com.joooin.repository.EventMemberDao;

@Repository
public class EventMemberDaoImpl implements EventMemberDao{
	@Autowired
	SessionFactory factory;
	
	@Override
	public EventMemberBean getByEventMemberId(Integer eventMemberId) {
		Session session = factory.getCurrentSession();
		return session.get(EventMemberBean.class, eventMemberId);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<EventMemberBean> getAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM EventMemberBean";
		return session.createQuery(hql).getResultList();
	}

	@Override
	public Integer save(EventMemberBean eventMemberBean) {
		Session session = factory.getCurrentSession();
		return (Integer)session.save(eventMemberBean);
	}

	@Override
	public void update(EventMemberBean eventMemberBean) {
		Session session = factory.getCurrentSession();
		session.update(eventMemberBean);
	}

	@Override
	public void deleteByEventMemberId(Integer eventMemberId) {
		Session session = factory.getCurrentSession();
		session.delete(session.get(EventMemberBean.class, eventMemberId));
	}
	
	
}
