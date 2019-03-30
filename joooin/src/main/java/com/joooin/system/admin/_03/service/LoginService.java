package com.joooin.system.admin._03.service;

import java.util.List;

import com.joooin.model.AdminBean;
import com.joooin.model.MemberMainBean;
import com.joooin.model.PunishmentBean;

public interface LoginService {

	public MemberMainBean checkEmailPassword(String email, String password);

	public void update(MemberMainBean memberMainBean);

	public AdminBean checkAdmin(String email, String password);
	
	public List<PunishmentBean> checkPunishment(Integer memberId);
}
