package com.joooin.system.group._42.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.joooin.model.GroupMainBean;
import com.joooin.repository.GroupMainDao;
import com.joooin.system.group._42.service.GroupService;

@Service
public class GroupServiceimpl implements GroupService{

	@Autowired
	GroupMainDao dao;
	
	@Transactional
	@Override
	public List<GroupMainBean> getAll() {
		
		return dao.getAll();
	}
	@Transactional
	@Override
	public List<GroupMainBean> getgrouptype(String grouponetype) {
		
		return dao.getgrouptype(grouponetype);
	}
	
	
}
