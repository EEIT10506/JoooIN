package com.joooin.system.group._42.service.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joooin.model.GroupMainBean;
import com.joooin.repository.GroupMainDao;
import com.joooin.system.group._42.service.GroupService_42;
@Service
public class GroupServiceImpl_42 implements GroupService_42 {
	@Autowired
	SessionFactory factory;
	
	@Autowired
	GroupMainDao dao;
	@Override
	public List<GroupMainBean> getAll() {
		// TODO Auto-generated method stub
		return dao.getAll();
	}

	@Override
	public List<GroupMainBean> getGroupType(String groupOneType) {
		// TODO Auto-generated method stub
		return dao.getGroupType(groupOneType);
	}

}
