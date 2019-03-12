package com.joooin.system.admin._03.service;

import java.util.List;

import com.joooin.model.MemberMainBean;

public interface RegisterService {

	public MemberMainBean getByMemberId(Integer memberId);
	public List<MemberMainBean> getAll();
	public Integer save(MemberMainBean memberMainBean);
	public void update(MemberMainBean memberMainBean);
	public void deleteByMemberId(Integer memberId);
	public Boolean checkEmail(String email);
	public Boolean activeUser(String certificationHash);
	
}
