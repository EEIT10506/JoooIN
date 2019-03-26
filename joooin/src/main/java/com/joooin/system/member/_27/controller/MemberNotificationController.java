package com.joooin.system.member._27.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joooin.system.member._27.service.NotificationService;

@Controller
public class MemberNotificationController {
	@Autowired
	NotificationService notificationService;
	
	@RequestMapping(value = "/member/notification", method = RequestMethod.GET)
	public String getNotifications(HttpSession session, Model model) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		if (memberId != null) {
			model.addAttribute("list", notificationService.getNotifications(memberId));
			return "member/self/notification";
		} else {
			return "not_login";
		}
	}
	
	@RequestMapping(value = "/member/setOneNotificationRead", method = RequestMethod.POST)
	public @ResponseBody String setOneNotificationRead(Integer notificationId, HttpSession session) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		if (memberId != null) {
			notificationService.setOneNotificationRead(notificationId);
			return null;
		} else {
			return "not_login";
		}
	}
	
	@RequestMapping(value = "/member/setAllNotificationsRead", method = RequestMethod.POST)
	public @ResponseBody String setAllNotificationsRead(String memberId, HttpSession session) {
		System.out.println("memberId = " + memberId);
		
		if (memberId != null) {
			System.out.println("進入controller");
			notificationService.setAllNotificationsRead(Integer.valueOf(memberId));
			System.out.println("離開controller");
			return null;
		} else {
			return "not_login";
		}
	}
	
	
}
