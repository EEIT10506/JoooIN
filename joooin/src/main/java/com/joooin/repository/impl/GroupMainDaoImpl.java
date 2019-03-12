package com.joooin.repository.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.joooin.model.GroupMainBean;
import com.joooin.repository.GroupMainDao;

@Repository
public class GroupMainDaoImpl implements GroupMainDao{
	@Autowired
	SessionFactory factory;
	
	@Override
	public GroupMainBean getByGroupId(Integer groupId) {
		Session session = factory.getCurrentSession();
		return session.get(GroupMainBean.class, groupId);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<GroupMainBean> getAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM GroupMainBean";
		return session.createQuery(hql).getResultList();
	}

	@Override
	public Integer save(GroupMainBean groupMainBean) {
		Session session = factory.getCurrentSession();
		return (Integer)session.save(groupMainBean);
	}

	@Override
	public void update(GroupMainBean groupMainBean) {
		Session session = factory.getCurrentSession();
		session.update(groupMainBean);
	}

	@Override
	public void delete(GroupMainBean groupMainBean) {
		Session session = factory.getCurrentSession();
		session.delete(groupMainBean);
	}

	@Override
	public void deleteByGroupId(Integer groupId) {
		Session session = factory.getCurrentSession();
		session.delete(session.get(GroupMainBean.class, groupId));
	}
	
//新增查詢單一種類方法Byfu
	@SuppressWarnings("unchecked")
	@Override
	public List<GroupMainBean> getgrouptype(String grouponetype){
		Session session = factory.getCurrentSession();
		String hql = "FROM GroupMainBean WHERE groupType =:grouponetype";
		return session.createQuery(hql).setParameter("grouponetype", grouponetype).getResultList();

		}
	
}
