package com.joooin.system.member._27.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberNotificationController {
	
	@RequestMapping(value = "/member/notification", method = RequestMethod.GET)
	public String navbar(HttpSession session, Model model) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		if (memberId != null) {
			return "member/self/notification";
		} else {
			return "not_login";
		}
	}
}
