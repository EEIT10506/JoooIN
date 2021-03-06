package com.joooin.system.admin._03.service.impl;

import java.sql.SQLException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.joooin.model.MemberMainBean;
import com.joooin.repository.MemberMainDao;
import com.joooin.system.admin._03.service.ForgotPasswordService;
import com.joooin.util.RandomStringUtil;

@Service
@Transactional
public class ForgotPasswordServiceImpl implements ForgotPasswordService {
	
	@Autowired
	MemberMainDao dao;

	@Autowired
	JavaMailSender mailSender;

	@Override
	public void updateNsendNewPassword(String email) throws MessagingException, SQLException {
		
		MemberMainBean mmb = dao.checkEmail(email);
		if (mmb != null) {

			String newPassword = RandomStringUtil.getRandomString();
			mmb.setPassword(newPassword);
			dao.update(mmb);
			
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

			helper.setFrom("eeit105joooin@gmail.com");// 發件人
			helper.setTo(email);// 收件人
			helper.setSubject("<重要> JOOOIN 密碼重設");// 主題
			helper.setText("<html><meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"><body>"
					+ "<h4>您的名稱:" + mmb.getMemberName() + "</h4><br><h4>您的新密碼是" + newPassword
					+ "</h4><br>登入後請盡速修改。<br><p>joooin團隊敬上</p>" + "</body></html>", true);// 正文
			mailSender.send(message);
			System.out.println("發送完成");

		}
		

	}
	

}
