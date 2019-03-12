package com.joooin.system.admin._03.controller;

import java.sql.SQLException;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.joooin.system.admin._03.service.ForgotPasswordService;

@Controller
public class ForgotPasswordController {
	
	@Autowired
	ForgotPasswordService service;
	
	@RequestMapping(value = "forgotPassword", method = RequestMethod.GET)
	public String forgotPassword() {
		return "/admin/forgotPassword";
	}
	
	@RequestMapping(value = "forgotPassword", method = RequestMethod.POST)
	public String resetPassword(@RequestParam("email") String email, Model model) throws SQLException, MessagingException {

		service.updateNsendNewPassword(email);

		model.addAttribute("message", "新的密碼已經寄送到您的email內，登入後請盡速修改");

		return "/admin/newPassword";
	}

}
