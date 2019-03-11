package com.joooin.system.admin._03.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.joooin.model.AdminBean;
import com.joooin.model.MemberMainBean;
import com.joooin.repository.AdminDao;
import com.joooin.repository.MemberMainDao;
import com.joooin.system.admin._03.service.LoginService;

@Service
@Transactional
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	MemberMainDao dao;
	@Autowired
	AdminDao ab;
	
	public MemberMainBean processLogin(String email, String password) {
		MemberMainBean mmb = checkIDPassword(email, password);
		return mmb;
	}

	@Override
	public MemberMainBean checkIDPassword(String email, String password) {
		return dao.checkIDPassword(email, password);
	}

	@Override
	public void update(MemberMainBean memberMainBean) {
		dao.update(memberMainBean);
	}

	@Override
	public AdminBean check(String email) {
		return ab.check(email);
	}

}
