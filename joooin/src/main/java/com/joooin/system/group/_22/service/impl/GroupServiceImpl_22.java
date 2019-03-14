package com.joooin.system.group._22.service.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joooin.model.GroupMainBean;
import com.joooin.repository.GroupMainDao;
import com.joooin.system.group._22.service.GroupService_22;


@Service
public class GroupServiceImpl_22 implements GroupService_22 {

	@Autowired
	SessionFactory factory;
	
	@Autowired
	GroupMainDao dao;
	
	@Override
	public GroupMainBean getByGroupId(Integer groupId) {
		return dao.getByGroupId(groupId);
	}

	@Override
	public void createGroup(GroupMainBean groupMainBean) {
		dao.save(groupMainBean);
	}

}
