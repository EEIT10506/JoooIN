package com.joooin.repository.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.joooin.model.GroupPostReplyBean;
import com.joooin.repository.GroupPostReplyDao;

@Repository
@Transactional
public class GroupPostReplyDaoImpl implements GroupPostReplyDao{
	@Autowired
	SessionFactory factory;
	
	@Override
	public GroupPostReplyBean getByGroupPostReplyId(Integer groupPostReplyId) {
		Session session = factory.getCurrentSession();
		return session.get(GroupPostReplyBean.class, groupPostReplyId);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<GroupPostReplyBean> getAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM GroupPostReplyBean";
		return session.createQuery(hql).getResultList();
	}

	@Override
	public Integer save(GroupPostReplyBean groupPostReplyBean) {
		Session session = factory.getCurrentSession();
		return (Integer)session.save(groupPostReplyBean);
	}

	@Override
	public void update(GroupPostReplyBean groupPostReplyBean) {
		Session session = factory.getCurrentSession();
		session.update(groupPostReplyBean);
	}

	@Override
	public void deleteByGroupPostReplyId(Integer groupPostReplyId) {
		Session session = factory.getCurrentSession();
		session.delete(session.get(GroupPostReplyBean.class, groupPostReplyId));
	}
	
	
}
