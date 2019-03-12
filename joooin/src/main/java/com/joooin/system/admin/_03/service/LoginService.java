package com.joooin.system.admin._03.service;

import com.joooin.model.AdminBean;
import com.joooin.model.MemberMainBean;

public interface LoginService {

	public MemberMainBean checkIDPassword(String email, String password) ;
	public void update(MemberMainBean memberMainBean);
	public AdminBean check(String email);
}
