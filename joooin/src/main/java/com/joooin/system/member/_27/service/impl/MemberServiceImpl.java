package com.joooin.system.member._27.service.impl;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joooin.model.MemberMainBean;
import com.joooin.repository.MemberMainDao;
import com.joooin.system.member._27.service.MemberService;

@Service
@Transactional
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberMainDao memberMainDao;
	
	@Override
	public MemberMainBean getMemberMainBean(Integer memberId) {
		return memberMainDao.getByMemberId(memberId);
	}

	
	
}
