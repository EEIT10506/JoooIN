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
		model.addAttribute("list", notificationService.getNotifications(memberId));
		return "member/self/notification";
	}
	
	@RequestMapping(value = "/member/setOneNotificationRead", method = RequestMethod.POST)
	public @ResponseBody void setOneNotificationRead(Integer notificationId, HttpSession session) {
		notificationService.setOneNotificationRead(notificationId);
	}
	
	@RequestMapping(value = "/member/setAllNotificationsRead", method = RequestMethod.POST)
	public @ResponseBody void setAllNotificationsRead(String memberId, HttpSession session) {
		notificationService.setAllNotificationsRead(Integer.valueOf(memberId));
	}
	
}
