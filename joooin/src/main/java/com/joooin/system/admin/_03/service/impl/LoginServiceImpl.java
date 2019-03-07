package com.joooin.system.admin._03.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.joooin.model.MemberMainBean;
import com.joooin.repository.MemberMainDao;
import com.joooin.system.admin._03.service.LoginService;

@Service
@Transactional
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	MemberMainDao dao;

	@Override
	public MemberMainBean getByMemberId(Integer memberId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemberMainBean> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer save(MemberMainBean memberMainBean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(MemberMainBean memberMainBean) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteByMemberId(Integer memberId) {
		// TODO Auto-generated method stub

	}

	@Override
	public MemberMainBean getByEmail(String email) {
		return dao.getByEmail(email);
	}

	@Override
	public Boolean checkId(String email, String password) {
		Boolean Id = null;
		MemberMainBean member = dao.getByEmail(email);
		if(member!=null) {
			System.out.println("有這個帳號");
			if(password.equals(member.getPassword())) {
				Id = true;
			}else {
				System.out.println("密碼不正確");
				Id=false;
			}
		}else {
			System.out.println("沒有這個帳號");
			Id = false;
		}
		return Id;
	}

	@Override
	public MemberMainBean getMemberInfo(String email) {
		MemberMainBean member = dao.getByEmail(email);
		return member;
	}

}
