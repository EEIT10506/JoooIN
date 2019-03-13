package com.joooin.system.admin._03.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.joooin.model.EventMainBean;
import com.joooin.model.GroupMainBean;
import com.joooin.model.MemberMainBean;
import com.joooin.repository.EventMainDao;
import com.joooin.repository.GroupMainDao;
import com.joooin.repository.MemberMainDao;
import com.joooin.system.admin._03.service.AdminService;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	MemberMainDao mmd;
	
	@Autowired
	GroupMainDao gmd;
	
	@Autowired
	EventMainDao emd;

	@Override
	public List<MemberMainBean> getAllMember() {
		return mmd.getAll();
	}

	@Override
	public List<GroupMainBean> getAllGroup() {
		return gmd.getAll();
	}

	@Override
	public List<EventMainBean> getAllEvent() {
		return emd.getAll();
	}

}
