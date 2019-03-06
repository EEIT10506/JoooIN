package com.joooin.system.admin._03.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

	@RequestMapping(value = "login")
	public String login(Model model) {
		return "admin/login";
	}
}
