package com.joooin.repository.impl;

import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.joooin.model.MemberMainBean;
import com.joooin.repository.MemberMainDao;
import com.joooin.system.admin._03.model.AllMemberQuantityBean;

@Repository
public class MemberMainDaoImpl implements MemberMainDao{
	@Autowired
	SessionFactory factory;
	
	@Override
	public MemberMainBean getByMemberId(Integer memberId) {
		Session session = factory.getCurrentSession();
		return session.get(MemberMainBean.class, memberId);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MemberMainBean> getAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM MemberMainBean";
		return session.createQuery(hql).getResultList();
	}

	@Override
	public Integer save(MemberMainBean memberMainBean) {
		Session session = factory.getCurrentSession();
		return (Integer)session.save(memberMainBean);
	}

	@Override
	public void update(MemberMainBean memberMainBean) {
		Session session = factory.getCurrentSession();
		session.update(memberMainBean);
	}

	@Override
	public void deleteByMemberId(Integer memberId) {
		Session session = factory.getCurrentSession();
		session.delete(session.get(MemberMainBean.class, memberId));
	}

	@Override
	public MemberMainBean checkIDPassword(String email, String password) {
		MemberMainBean mmb = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM MemberMainBean m WHERE m.email = :email and m.password = :password";
		
		try {
			mmb = (MemberMainBean)session.createQuery(hql)
					.setParameter("email", email)
					.setParameter("password", password)
					.uniqueResult();
		} catch (NoResultException ex) {
			mmb = null;
		}
		
		return mmb;
	}

	@Override
	public MemberMainBean checkEmail(String email) {
		MemberMainBean mmb = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM MemberMainBean m WHERE m.email = :email";
		
		mmb = (MemberMainBean)session.createQuery(hql)
				.setParameter("email", email)
				.uniqueResult();
		
		return mmb;
	}

	@Override
	public int activeUser(String certificationHash) {
		
		Session session = factory.getCurrentSession();
		String hql = "UPDATE MemberMainBean set certificationStatus = 1 WHERE certificationHash= :certificationHash";
		int mmb = 0;
		mmb = session.createQuery(hql)
				.setParameter("certificationHash", certificationHash)
				.executeUpdate();
		System.out.println("hash="+certificationHash);
		System.out.println("mmb="+mmb);
		
		return mmb;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AllMemberQuantityBean> getAllMemberQuantity() {
		Session session = factory.getCurrentSession();
		return session.createNativeQuery("select COUNT(memberId) as memberId ,gender as gender from member_main group by gender").addEntity(AllMemberQuantityBean.class).list();
//		return session.createQuery("select count(*) from MemberMainBean group by gender").list();
//		return session.createNativeQuery("select count(memberId), gender from member_main group by gender").addEntity(AllMemberQuantityBean.class).list();
//		return null;

	}
	
}
