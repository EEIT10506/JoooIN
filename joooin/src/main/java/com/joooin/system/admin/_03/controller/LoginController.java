package com.joooin.system.admin._03.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.joooin.model.MemberMainBean;
import com.joooin.system.admin._03.service.LoginService;

@Controller
public class LoginController {

	@Autowired
	LoginService service;

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(Model model) {
		MemberMainBean mmb = new MemberMainBean();
		model.addAttribute("memberMainBean", mmb);
		return "admin/login";
	}

	@RequestMapping(value = "loginProcess", method = RequestMethod.POST)
	public String loginProcess(@ModelAttribute("memberMainBean") MemberMainBean mmb, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Boolean check = service.checkId(mmb.getEmail(), mmb.getPassword());
		if (check == true) {
			MemberMainBean meminfo = service.getMemberInfo(mmb.getEmail());
			session.setAttribute("LoginOK", meminfo);
			return "redirect:/";
		} else {
			return "admin/login";
		}
	}
}
