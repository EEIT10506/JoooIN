package com.joooin.repository.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.joooin.model.PunishmentBean;
import com.joooin.repository.PunishmentDao;

@Repository
@Transactional
public class PunishmentDaoImpl implements PunishmentDao{
	@Autowired
	SessionFactory factory;
	
	@Override
	public PunishmentBean getByPunishmentId(Integer punishmentId) {
		Session session = factory.getCurrentSession();
		return session.get(PunishmentBean.class, punishmentId);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PunishmentBean> getAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM PunishmentBean";
		return session.createQuery(hql).getResultList();
	}

	@Override
	public Integer save(PunishmentBean punishmentBean) {
		Session session = factory.getCurrentSession();
		return (Integer)session.save(punishmentBean);
	}

	@Override
	public void update(PunishmentBean punishmentBean) {
		Session session = factory.getCurrentSession();
		session.update(punishmentBean);
	}

	@Override
	public void deleteByPunishmentId(Integer punishmentId) {
		Session session = factory.getCurrentSession();
		session.delete(session.get(PunishmentBean.class, punishmentId));
	}
	
	
}
