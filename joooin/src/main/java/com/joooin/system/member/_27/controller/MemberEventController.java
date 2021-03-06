package com.joooin.system.member._27.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joooin.model.MemberMainBean;
import com.joooin.system.member._27.service.MemberService;

@Controller
public class MemberEventController {
	@Autowired
	MemberService memberService;
	                                               
	@RequestMapping(value = "/member/self/event/{link}", method = RequestMethod.GET)
	public String getEvents(@PathVariable String link, HttpSession session, Model model) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		model.addAttribute("eventList", memberService.getEvents(memberId, link));
		return "member/self/event/" + link;
	}

	@RequestMapping(value = "/member/deleteEvent", method = RequestMethod.POST)
	public @ResponseBody void deleteEvent(Integer eventId, HttpSession session) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		memberService.deleteEvent(memberId, eventId);
	}
	
	@RequestMapping(value = "/member/cancelEvent", method = RequestMethod.POST)
	public @ResponseBody void cancelEvent(Integer eventId, HttpSession session) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		memberService.cancelEvent(memberId, eventId);
	}
	
	@RequestMapping(value = "/member/noLikeEvent", method = RequestMethod.POST)
	public @ResponseBody void noLikeEvent(Integer eventId, HttpSession session) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		memberService.noLikeEvent(memberId, eventId);
	}
	
	@RequestMapping(value = "/member/other/event/{otherMemberId}", method = RequestMethod.GET)
	public String getOtherEvents(@PathVariable Integer otherMemberId, HttpSession session, Model model) {
		Integer selfMemberId = (Integer)session.getAttribute("memberId");

		if (selfMemberId == null || !selfMemberId.equals(otherMemberId)) {
			MemberMainBean bean = memberService.getMemberMainBean(otherMemberId);
			if (bean != null) {
				model.addAttribute("memberMainBean", bean);
				model.addAttribute("eventList", memberService.getOtherEvents(otherMemberId));
				return "member/other/event";
			} else {
				return "member/other/no_member";
			}
		} else {
			return "redirect:/member/self/event/my_event";
		}
	}
	
}
