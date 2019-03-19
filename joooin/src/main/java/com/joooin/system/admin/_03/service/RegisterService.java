package com.joooin.system.admin._03.service;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import com.joooin.model.MemberMainBean;

public interface RegisterService {

	public Integer save(MemberMainBean memberMainBean);

	public Boolean checkEmail(String email);

	public Boolean activeUser(String certificationHash);

	public void certification(MemberMainBean mmb, HttpServletRequest request) throws MessagingException;

	public MemberMainBean checkCertification(String email);

	public void certificationChangeStatus(String certificationHash);
	
	public MemberMainBean getMemberByEmail(String email);
}
