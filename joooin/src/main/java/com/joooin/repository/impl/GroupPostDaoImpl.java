package com.joooin.repository.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.joooin.model.GroupPostBean;
import com.joooin.repository.GroupPostDao;

@Repository
@Transactional
public class GroupPostDaoImpl implements GroupPostDao{
	@Autowired
	SessionFactory factory;
	
	@Override
	public GroupPostBean getByGroupPostId(Integer groupPostId) {
		Session session = factory.getCurrentSession();
		return session.get(GroupPostBean.class, groupPostId);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<GroupPostBean> getAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM GroupPostBean";
		return session.createQuery(hql).getResultList();
	}

	@Override
	public Integer save(GroupPostBean groupPostBean) {
		Session session = factory.getCurrentSession();
		return (Integer)session.save(groupPostBean);
	}

	@Override
	public void update(GroupPostBean groupPostBean) {
		Session session = factory.getCurrentSession();
		session.update(groupPostBean);
	}

	@Override
	public void deleteByGroupPostId(Integer groupPostId) {
		Session session = factory.getCurrentSession();
		session.delete(session.get(GroupPostBean.class, groupPostId));
	}
	
	
}
