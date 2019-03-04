package com.joooin.repository.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.joooin.model.ReportBean;
import com.joooin.repository.ReportDao;

@Repository
@Transactional
public class ReportDaoImpl implements ReportDao{
	@Autowired
	SessionFactory factory;
	
	@Override
	public ReportBean getByReportId(Integer reportId) {
		Session session = factory.getCurrentSession();
		return session.get(ReportBean.class, reportId);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ReportBean> getAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ReportBean";
		return session.createQuery(hql).getResultList();
	}

	@Override
	public Integer save(ReportBean reportBean) {
		Session session = factory.getCurrentSession();
		return (Integer)session.save(reportBean);
	}

	@Override
	public void update(ReportBean reportBean) {
		Session session = factory.getCurrentSession();
		session.update(reportBean);
	}

	@Override
	public void deleteByReportId(Integer reportId) {
		Session session = factory.getCurrentSession();
		session.delete(session.get(ReportBean.class, reportId));
	}
	
	
}
