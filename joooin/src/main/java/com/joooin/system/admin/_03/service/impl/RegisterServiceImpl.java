package com.joooin.system.admin._03.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.joooin.model.MemberMainBean;
import com.joooin.system.admin._03.service.RegisterService;

@Service
@Transactional
public class RegisterServiceImpl implements RegisterService {

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

}
