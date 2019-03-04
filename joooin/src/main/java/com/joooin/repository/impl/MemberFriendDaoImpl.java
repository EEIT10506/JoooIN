package com.joooin.repository.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.joooin.model.MemberFriendBean;
import com.joooin.repository.MemberFriendDao;

@Repository
@Transactional
public class MemberFriendDaoImpl implements MemberFriendDao{
	@Autowired
	SessionFactory factory;
	
	@Override
	public MemberFriendBean getByMemberFriendId(Integer memberFriendId) {
		Session session = factory.getCurrentSession();
		return session.get(MemberFriendBean.class, memberFriendId);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MemberFriendBean> getAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM MemberFriendBean";
		return session.createQuery(hql).getResultList();
	}

	@Override
	public Integer save(MemberFriendBean memberFriendBean) {
		Session session = factory.getCurrentSession();
		return (Integer)session.save(memberFriendBean);
	}

	@Override
	public void update(MemberFriendBean memberFriendBean) {
		Session session = factory.getCurrentSession();
		session.update(memberFriendBean);
	}

	@Override
	public void deleteByMemberFriendId(Integer memberFriendId) {
		Session session = factory.getCurrentSession();
		session.delete(session.get(MemberFriendBean.class, memberFriendId));
	}
	
	
}
