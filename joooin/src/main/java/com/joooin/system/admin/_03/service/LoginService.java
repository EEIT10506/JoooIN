package com.joooin.system.admin._03.service;

import java.util.List;

import com.joooin.model.MemberMainBean;

public interface LoginService {

	public MemberMainBean getByMemberId(Integer memberId);
	public List<MemberMainBean> getAll();
	public Integer save(MemberMainBean memberMainBean);
	public void update(MemberMainBean memberMainBean);
	public void deleteByMemberId(Integer memberId);
	public MemberMainBean getByEmail(String email);
	public Boolean checkId(String email,String password);
	public MemberMainBean getMemberInfo(String email);
}
