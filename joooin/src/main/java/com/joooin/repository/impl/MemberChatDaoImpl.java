package com.joooin.repository.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.joooin.model.MemberChatBean;
import com.joooin.repository.MemberChatDao;

@Repository
public class MemberChatDaoImpl implements MemberChatDao{
	@Autowired
	SessionFactory factory;
	
	@Override
	public MemberChatBean getByMemberChatId(Integer memberChatId) {
		Session session = factory.getCurrentSession();
		return session.get(MemberChatBean.class, memberChatId);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MemberChatBean> getAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM MemberChatBean";
		return session.createQuery(hql).getResultList();
	}

	@Override
	public Integer save(MemberChatBean memberChatBean) {
		Session session = factory.getCurrentSession();
		return (Integer)session.save(memberChatBean);
	}

	@Override
	public void update(MemberChatBean memberChatBean) {
		Session session = factory.getCurrentSession();
		session.update(memberChatBean);
	}

	@Override
	public void deleteByMemberChatId(Integer memberChatId) {
		Session session = factory.getCurrentSession();
		session.delete(session.get(MemberChatBean.class, memberChatId));
	}
	
	
}
