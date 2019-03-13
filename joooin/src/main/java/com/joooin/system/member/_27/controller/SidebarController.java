package com.joooin.system.member._27.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.joooin.model.MemberMainBean;
import com.joooin.system.member._27.service.MemberService;

@Controller
public class SidebarController {
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "/member/self/sidebar", method = RequestMethod.GET)
	public String selfSidebar() {
		return "/member/self/sidebar";
	}
	
	@RequestMapping(value = "/member/other/sidebar", method = RequestMethod.GET)
	public String otherSidebar(Model model) {
		return "/member/other/sidebar";
	}
	
	@RequestMapping(value = "/member/my", method = RequestMethod.GET)
	public String selfMember(Model model, HttpSession session) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		if (memberId != null) {
			MemberMainBean mmb = memberService.getMemberMainBean(memberId);
			model.addAttribute("memberMainBean", mmb);
			return "member/self/member";
		} else {
			return "not_login";
		}
	}
	
	@RequestMapping(value = "/member/other/{otherMemberId}", method = RequestMethod.GET)
	public String otherMember(@PathVariable Integer otherMemberId, Model model, HttpSession session) {
		Integer selfMemberId = (Integer)session.getAttribute("memberId");
		
		if (!selfMemberId.equals(otherMemberId)) {
			MemberMainBean mmb = memberService.getMemberMainBean(otherMemberId);
			model.addAttribute("memberMainBean", mmb);
			return "member/other/member";
		} else {
			return "redirect:/member/my";
		}
	}
	
	@RequestMapping(value = "/member/my/{link}", method = RequestMethod.GET)
	public String selfLink(@PathVariable String link, Model model, HttpSession session) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		if (memberId != null) {
			MemberMainBean mmb = memberService.getMemberMainBean(memberId);
			model.addAttribute("memberMainBean", mmb);
			return "member/self/" + link;
		} else {
			return "not_login";
		}
	}
	
	@RequestMapping(value = "/member/other/{link}/{otherMemberId}", method = RequestMethod.GET)
	public String otherLink(@PathVariable String link, @PathVariable Integer otherMemberId, Model model, HttpSession session) {
		Integer selfMemberId = (Integer)session.getAttribute("memberId");
		
		if (selfMemberId != otherMemberId) {
			MemberMainBean mmb = memberService.getMemberMainBean(otherMemberId);
			model.addAttribute("memberMainBean", mmb);
			return "member/other/" + link;
		} else {
			return "redirect:/member/my/" + link;
		}
	}
	
}
