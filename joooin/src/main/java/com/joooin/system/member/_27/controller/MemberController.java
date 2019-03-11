package com.joooin.system.member._27.controller;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.joooin.model.MemberMainBean;
import com.joooin.system.member._27.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	MemberService memberService;
	@Autowired
	ServletContext context;
	
	@RequestMapping(method = RequestMethod.GET, value = "/member/sidebar")
	public String navbar() {
		return "/member/sidebar";
	}
	
	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public String member(Model model, HttpSession session) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		if (memberId != null) {
			MemberMainBean mmb = memberService.getMemberMainBean(memberId);
			model.addAttribute("bean", mmb);
			return "member/self/member";
		} else {
			return "member/self/not_login";
		}
	}
	
	@RequestMapping(value = "/member/profile", method = RequestMethod.GET)
	public String profile() {
		return "member/self/profile";
	}
	@RequestMapping(value = "/member/friend", method = RequestMethod.GET)
	public String friend() {
		return "member/self/friend";
	}
	@RequestMapping(value = "/member/event", method = RequestMethod.GET)
	public String event() {
		return "member/self/event";
	}
	@RequestMapping(value = "/member/group", method = RequestMethod.GET)
	public String group() {
		return "member/self/group";
	}
	@RequestMapping(value = "/member/message", method = RequestMethod.GET)
	public String message() {
		return "member/self/message";
	}
	
}
