package com.joooin.system.member._27.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.joooin.system.member._27.service.NotificationService;

@Controller
public class MemberNotificationController {
	@Autowired
	NotificationService notificationService;
	
	@RequestMapping(value = "/member/notification", method = RequestMethod.GET)
	public String navbar(HttpSession session, Model model) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		if (memberId != null) {
			model.addAttribute("list", notificationService.getNotifications(memberId));
			return "member/self/notification";
		} else {
			return "not_login";
		}
	}
}
