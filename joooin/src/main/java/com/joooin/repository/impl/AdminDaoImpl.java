package com.joooin.repository.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.joooin.model.AdminBean;
import com.joooin.repository.AdminDao;

@Repository
@Transactional
public class AdminDaoImpl implements AdminDao{
	@Autowired
	SessionFactory factory;
	
	@Override
	public AdminBean getByAdminId(Integer adminId) {
		Session session = factory.getCurrentSession();
		return session.get(AdminBean.class, adminId);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AdminBean> getAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM AdminBean";
		return session.createQuery(hql).getResultList();
	}

	@Override
	public Integer save(AdminBean adminBean) {
		Session session = factory.getCurrentSession();
		return (Integer)session.save(adminBean);
	}

	@Override
	public void update(AdminBean adminBean) {
		Session session = factory.getCurrentSession();
		session.update(adminBean);
	}

	@Override
	public void deleteByAdminId(Integer adminId) {
		Session session = factory.getCurrentSession();
		session.delete(session.get(AdminBean.class, adminId));
	}
	
	
}
