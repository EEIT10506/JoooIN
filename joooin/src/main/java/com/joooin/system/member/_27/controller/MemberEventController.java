package com.joooin.system.member._27.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joooin.system.member._27.service.MemberService;

@Controller
public class MemberEventController {
	@Autowired
	MemberService memberService;
	                                               
	@RequestMapping(value = "/member/self/event/{link}", method = RequestMethod.GET)
	public String getEvents(@PathVariable String link, HttpSession session, Model model) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		if (memberId != null) {
			model.addAttribute("eventList", memberService.getEvents(memberId, link));
			return "member/self/event/" + link;
		} else {
			return "not_login";
		}	
	}

	@RequestMapping(value = "/member/deleteEvent", method = RequestMethod.POST)
	public @ResponseBody String deleteEvent(Integer eventId, HttpSession session) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		if (memberId != null) {
			memberService.deleteEvent(memberId, eventId);
			return null;
		} else {
			return "not_login";
		}	
	}
	
	@RequestMapping(value = "/member/cancelEvent", method = RequestMethod.POST)
	public @ResponseBody String cancelEvent(Integer eventId, HttpSession session) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		if (memberId != null) {
			memberService.cancelEvent(memberId, eventId);
			return null;
		} else {
			return "not_login";
		}	
	}
	
	@RequestMapping(value = "/member/noLikeEvent", method = RequestMethod.POST)
	public @ResponseBody String noLikeEvent(Integer eventId, HttpSession session) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		if (memberId != null) {
			memberService.noLikeEvent(memberId, eventId);
			return null;
		} else {
			return "not_login";
		}	
	}
	
	@RequestMapping(value = "/member/other/event/{otherMemberId}", method = RequestMethod.GET)
	public String getOtherEvents(@PathVariable Integer otherMemberId, HttpSession session, Model model) {
		Integer selfMemberId = (Integer)session.getAttribute("memberId");

		if (selfMemberId == null || !selfMemberId.equals(otherMemberId)) {
			model.addAttribute("memberMainBean", memberService.getMemberMainBean(otherMemberId));
			model.addAttribute("eventList", memberService.getOtherEvents(otherMemberId));
			return "member/other/event";
		} else {
			return "redirect:/member/self/event/my_event";
		}
	}
	
}
