package com.joooin.system.member._27.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.joooin.system.member._27.service.MemberService;

@Controller
public class MemberHomeController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public String selfMember(Model model, HttpSession session) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		model.addAttribute("memberMainBean", memberService.getMemberMainBean(memberId));		
		return "member/self/member";
	}
	
	@RequestMapping(value = "/member/modifyIntro", method = RequestMethod.POST)
	public String modifyIntro(String memberIntro, HttpSession session) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		memberService.modifyIntro(memberId, memberIntro);
		return "redirect:/member";
	}
	
	@RequestMapping(value = "/member/other/{otherMemberId}", method = RequestMethod.GET)
	public String otherMember(@PathVariable Integer otherMemberId, Model model, HttpSession session) {
		Integer selfMemberId = (Integer)session.getAttribute("memberId");
		
		if (selfMemberId == null || !selfMemberId.equals(otherMemberId)) {
			model.addAttribute("memberMainBean", memberService.getMemberMainBean(otherMemberId));
			return "member/other/member";
		} else {
			return "redirect:/member";
		}
	}
}
