package com.joooin.repository.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.joooin.model.GroupMemberBean;
import com.joooin.repository.GroupMemberDao;

@Repository
public class GroupMemberDaoImpl implements GroupMemberDao{
	@Autowired
	SessionFactory factory;
	
	@Override
	public GroupMemberBean getByGroupMemberId(Integer groupMemberId) {
		Session session = factory.getCurrentSession();
		return session.get(GroupMemberBean.class, groupMemberId);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<GroupMemberBean> getAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM GroupMemberBean";
		return session.createQuery(hql).getResultList();
	}

	@Override
	public Integer save(GroupMemberBean groupMainBean) {
		Session session = factory.getCurrentSession();
		return (Integer)session.save(groupMainBean);
	}

	@Override
	public void update(GroupMemberBean groupMainBean) {
		Session session = factory.getCurrentSession();
		session.update(groupMainBean);
	}

	@Override
	public void deleteByGroupMemberId(Integer groupMemberId) {
		Session session = factory.getCurrentSession();
		session.delete(session.get(GroupMemberBean.class, groupMemberId));
	}
	
	
}
