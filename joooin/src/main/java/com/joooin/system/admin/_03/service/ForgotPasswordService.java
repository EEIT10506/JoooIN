package com.joooin.system.admin._03.service;

import java.sql.SQLException;

import javax.mail.MessagingException;

public interface ForgotPasswordService {
	
	public void updateNsendNewPassword(String email) throws SQLException, MessagingException;


}
