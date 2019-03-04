package com.joooin.repository.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.joooin.model.GroupPostLikeBean;
import com.joooin.repository.GroupPostLikeDao;

@Repository
@Transactional
public class GroupPostLikeDaoImpl implements GroupPostLikeDao{
	@Autowired
	SessionFactory factory;
	
	@Override
	public GroupPostLikeBean getByGroupPostLikeId(Integer groupPostLikeId) {
		Session session = factory.getCurrentSession();
		return session.get(GroupPostLikeBean.class, groupPostLikeId);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<GroupPostLikeBean> getAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM GroupPostLikeBean";
		return session.createQuery(hql).getResultList();
	}

	@Override
	public Integer save(GroupPostLikeBean groupPostLikeBean) {
		Session session = factory.getCurrentSession();
		return (Integer)session.save(groupPostLikeBean);
	}

	@Override
	public void update(GroupPostLikeBean groupPostLikeBean) {
		Session session = factory.getCurrentSession();
		session.update(groupPostLikeBean);
	}

	@Override
	public void deleteByGroupPostLikeId(Integer groupPostLikeId) {
		Session session = factory.getCurrentSession();
		session.delete(session.get(GroupPostLikeBean.class, groupPostLikeId));
	}
	
	
}
