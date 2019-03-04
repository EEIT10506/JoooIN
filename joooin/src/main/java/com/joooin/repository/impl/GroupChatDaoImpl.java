package com.joooin.repository.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.joooin.model.GroupChatBean;
import com.joooin.repository.GroupChatDao;

@Repository
@Transactional
public class GroupChatDaoImpl implements GroupChatDao{
	@Autowired
	SessionFactory factory;
	
	@Override
	public GroupChatBean getByGroupChatId(Integer groupChatId) {
		Session session = factory.getCurrentSession();
		return session.get(GroupChatBean.class, groupChatId);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<GroupChatBean> getAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM GroupChatBean";
		return session.createQuery(hql).getResultList();
	}

	@Override
	public Integer save(GroupChatBean groupChatBean) {
		Session session = factory.getCurrentSession();
		return (Integer)session.save(groupChatBean);
	}

	@Override
	public void update(GroupChatBean groupChatBean) {
		Session session = factory.getCurrentSession();
		session.update(groupChatBean);
	}

	@Override
	public void deleteByGroupChatId(Integer groupChatId) {
		Session session = factory.getCurrentSession();
		session.delete(session.get(GroupChatBean.class, groupChatId));
	}
	
	
}
