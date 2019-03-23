package com.joooin.controller;

import java.util.LinkedList;
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
import com.joooin.repository.MemberMainDao;
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
		List<String> top8EventInviterNames = new LinkedList<String>();
		for(EventMainBean topEvent:top8Events) {
			top8EventInviterNames.add(memberService.getMemberMainBean(topEvent.getEventInviterId()).getMemberName());
		}
		
		List<GroupMainBean> top8Groups = eventService.getTop8Groups();
		List<String> top8GroupLeaderNames = new LinkedList<String>();
		for(GroupMainBean topGroup:top8Groups) {
			top8GroupLeaderNames.add(memberService.getMemberMainBean(topGroup.getGroupLeaderId()).getMemberName());
		}
				
		model.addAttribute("top8Events", top8Events);  //熱門EventMainBean的List
		model.addAttribute("top8EventInviterNames", top8EventInviterNames); //熱門Event的開團者字串List
		model.addAttribute("top8Groups", top8Groups);  //熱門GroupMainBean的List
		model.addAttribute("top8GroupLeaderNames", top8GroupLeaderNames); //熱門Group的Leader名(字串)List
		return "index";
	}
	@RequestMapping(value = "/navbar", method = RequestMethod.GET)
	public String navbar(HttpSession session, Model model) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		if (memberId != null) 
			model.addAttribute("notReadQuantity", messageService.getAllFriendNotReadQuantity(memberId));
		
		return "navbar";
	}
	@RequestMapping(value = "/footerbar", method = RequestMethod.GET)
	public String footerbar(HttpSession session, Model model) {
		return "footerbar";
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
