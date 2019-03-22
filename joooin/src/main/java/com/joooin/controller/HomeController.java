package com.joooin.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.joooin.model.EventMainBean;
import com.joooin.model.GroupMainBean;
import com.joooin.model.GroupPostBean;
import com.joooin.model.MemberMainBean;
import com.joooin.system.event._35.service.EventsService;
import com.joooin.system.group._22.service.GroupService_22;
import com.joooin.system.member._27.service.MemberService;
import com.joooin.system.member._27.service.MessageService;
import com.joooin.util.ImageUtils;

@Controller
public class HomeController {
	@Autowired
	MemberService memberService;
	@Autowired
	EventsService eventService;
	@Autowired
	GroupService_22 groupService;
	@Autowired
	ServletContext context;
	@Autowired
	MessageService messageService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homepage(Model model) {
		List<EventMainBean> top8Events = eventService.getTop8Events();
		List<GroupMainBean> top8Groups = eventService.getTop8Groups();
		List<GroupPostBean> top8GroupPosts = eventService.getTop8GroupPosts();
		model.addAttribute("top8Events", top8Events);
		model.addAttribute("top8Groups", top8Groups);
		model.addAttribute("top8GroupPosts", top8GroupPosts);
		return "index";
	}
	@RequestMapping(value = "/navbar", method = RequestMethod.GET)
	public String navbar(HttpSession session, Model model) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		if (memberId != null) 
			model.addAttribute("notReadQuantity", messageService.getAllFriendNotReadQuantity(memberId));
		
		return "navbar";
	}
	@RequestMapping(value = "/getMemberImage/{memberId}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getMemberImage(@PathVariable Integer memberId) {
		
		if (memberId != null) {
			MemberMainBean bean = memberService.getMemberMainBean(memberId);
			if (bean != null) {
				return ImageUtils.byteArrayToImage(bean.getMemberImage());
			} else {
				Byte[] b = ImageUtils.localImageToByteArray("no_image.png", context);
				return ImageUtils.byteArrayToImage(b);
			}
		} else {
			Byte[] b = ImageUtils.localImageToByteArray("no_image.png", context);
			return ImageUtils.byteArrayToImage(b);
		}
	}
	
	@RequestMapping(value = "/getEventImage/{eventId}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getEventImage(@PathVariable Integer eventId) {
			
		if (eventId != null) {
			EventMainBean bean = eventService.getByEventMainId(eventId);
			if (bean != null) {
				return ImageUtils.byteArrayToImage(bean.getEventImage());
			} else {
				Byte[] b = ImageUtils.localImageToByteArray("no_image.png", context);
				return ImageUtils.byteArrayToImage(b);
			}
		} else {
			Byte[] b = ImageUtils.localImageToByteArray("no_image.png", context);
			return ImageUtils.byteArrayToImage(b);
		}
	}
	
	@RequestMapping(value = "/getGroupImage/{groupId}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getGroupImage(@PathVariable Integer groupId) {
		
		if (groupId != null) {
			GroupMainBean bean = groupService.getByGroupId(groupId);
			if (bean != null) {
				return ImageUtils.byteArrayToImage(bean.getGroupImage());
			} else {
				Byte[] b = ImageUtils.localImageToByteArray("no_image.png", context);
				return ImageUtils.byteArrayToImage(b);
			}
		} else {
			Byte[] b = ImageUtils.localImageToByteArray("no_image.png", context);
			return ImageUtils.byteArrayToImage(b);
		}
	}
	
	@RequestMapping(value = "/notLogin", method = RequestMethod.GET)
	public String notLogin() {
		return "not_login";
	}
}
