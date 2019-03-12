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
	
	@RequestMapping(method = RequestMethod.GET, value = "/member/sidebar")
	public String navbar() {
		return "/member/sidebar";
	}
	
	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public String member(Model model, HttpSession session) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		if (memberId != null) {
			MemberMainBean mmb = memberService.getMemberMainBean(memberId);
			model.addAttribute("memberMainBean", mmb);
			return "member/self/member";
		} else {
			return "not_login";
		}
	}
	
	@RequestMapping(value = "/member/{link}", method = RequestMethod.GET)
	public String profile(@PathVariable String link, Model model, HttpSession session) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		if (memberId != null) {
			MemberMainBean mmb = memberService.getMemberMainBean(memberId);
			model.addAttribute("memberMainBean", mmb);
			return "member/self/" + link;
		} else {
			return "not_login";
		}
	}
	
}
