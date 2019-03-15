package com.joooin.system.group.service.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joooin.model.GroupMainBean;
import com.joooin.repository.GroupMainDao;
import com.joooin.system.group.service.GroupService;


@Service
public class GroupServiceImpl implements GroupService {

	@Autowired
	SessionFactory factory;
	
	@Autowired
	GroupMainDao dao;
	


	@Override
	public Integer createGroup(GroupMainBean groupMainBean) {
		Integer inte = dao.save(groupMainBean);
		return inte;
	}

}
