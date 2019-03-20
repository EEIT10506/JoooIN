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
import com.joooin.system.member._27.service.MessageService;

@Controller
public class MemberMessageController {
	@Autowired
	MemberService memberService;
	@Autowired
	MessageService messageService;
	
	@RequestMapping(value = "/member/self/message", method = RequestMethod.GET)
	public String messageHome(HttpSession session, Model model) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		System.out.println("跑錯錯錯錯錯錯錯錯錯錯錯錯錯錯錯錯錯錯錯錯錯錯錯錯錯錯錯錯錯錯錯錯錯錯錯錯錯錯錯錯錯錯錯錯");
		if (memberId != null) {
			model.addAttribute("friendList", memberService.getFriends(memberId));
			model.addAttribute("myself", memberService.getMemberMainBean(memberId));
			return "member/self/message/sidebar";
		} else {
			return "not_login";
		}	
	}                        
	@RequestMapping(value = "/member/self/message/{hash}", method = RequestMethod.GET)
	public String showMessage(@PathVariable String hash, HttpSession session, Model model) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		System.out.println(memberId);
		System.out.println(hash);
		if (memberId != null) {
			model.addAttribute("friend", messageService.getFriendMemberMainBean(memberId, hash));
			model.addAttribute("hash", hash);
			model.addAttribute("message", messageService.getMessage(hash));
			return "member/self/message/chat";
		} else {
			return "not_login";
		}	
	}
	                         
	@RequestMapping(value = "/member/self/message/saveText", method = RequestMethod.POST)
	public @ResponseBody String saveTextMessage(String text, Integer receiveMemberId, String messageHash, HttpSession session) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		if (memberId != null) {
			messageService.saveTextMessage(memberId, receiveMemberId, messageHash, text);
			return null;
		} else {
			return "not_login";
		}	
	}
}
