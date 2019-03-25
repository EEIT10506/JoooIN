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
public class MemberGroupController {
	@Autowired
	MemberService memberService;
	                                               
	@RequestMapping(value = "/member/self/group/{link}", method = RequestMethod.GET)
	public String getGroups(@PathVariable String link, HttpSession session, Model model) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		if (memberId != null) {
			model.addAttribute("groupList", memberService.getGroups(memberId, link));
			return "member/self/group/" + link;
		} else {
			return "not_login";
		}	
	}
	@RequestMapping(value = "/member/deleteGroup", method = RequestMethod.POST)
	public @ResponseBody String deleteGroup(Integer groupId, HttpSession session) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		if (memberId != null) {
			memberService.deleteGroup(memberId, groupId);
			return null;
		} else {
			return "not_login";
		}	
	}
	@RequestMapping(value = "/member/cancelGroup", method = RequestMethod.POST)
	public @ResponseBody String cancelGroup(Integer groupId, HttpSession session) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		if (memberId != null) {
			memberService.cancelGroup(memberId, groupId);
			return null;
		} else {
			return "not_login";
		}	
	}
	
	@RequestMapping(value = "/member/other/group/{otherMemberId}", method = RequestMethod.GET)
	public String getOtherGroups(@PathVariable Integer otherMemberId, HttpSession session, Model model) {
		Integer selfMemberId = (Integer)session.getAttribute("memberId");

		if (selfMemberId == null || !selfMemberId.equals(otherMemberId)) {
			model.addAttribute("memberMainBean", memberService.getMemberMainBean(otherMemberId));
			model.addAttribute("groupList", memberService.getOtherGroups(otherMemberId));
			return "member/other/group";
		} else {
			return "redirect:/member/self/group/my_group";
		}
	}
	
}
