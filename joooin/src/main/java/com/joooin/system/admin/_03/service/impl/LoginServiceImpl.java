package com.joooin.system.admin._03.service.impl;

import java.util.List;

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
	MemberMainDao memberMainDao;

	@Autowired
	AdminDao adminDao;

	@Override
	public MemberMainBean checkEmailPassword(String email, String password) {
		MemberMainBean mmb = new MemberMainBean();
		mmb = null;
		List<MemberMainBean> list = memberMainDao.getAll();
		for (MemberMainBean bean : list) {
			if (bean.getEmail().equals(email) && bean.getPassword().equals(password)) {
				mmb = bean;
			}
		}
		return mmb;
	}

	@Override
	public void update(MemberMainBean memberMainBean) {
		memberMainDao.update(memberMainBean);
	}

	@Override
	public AdminBean checkAdmin(String email, String passwrod) {
		AdminBean ab = new AdminBean();
		ab = null;
		List<AdminBean> list = adminDao.getAll();

		for (AdminBean bean : list) {
			if (bean.getName().equals(email) && bean.getPassword().equals(passwrod)) {
				ab = bean;
			}
		}
		return ab;
	}
}
