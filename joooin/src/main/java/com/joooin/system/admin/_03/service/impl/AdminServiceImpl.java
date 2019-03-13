package com.joooin.system.admin._03.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.joooin.model.MemberMainBean;
import com.joooin.repository.MemberMainDao;
import com.joooin.system.admin._03.service.AdminService;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	MemberMainDao mmd;

	@Override
	public List<MemberMainBean> getAllMember() {
		return mmd.getAll();
	}

}
