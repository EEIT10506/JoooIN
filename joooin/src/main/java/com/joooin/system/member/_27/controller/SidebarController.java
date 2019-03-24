package com.joooin.system.member._27.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
}
