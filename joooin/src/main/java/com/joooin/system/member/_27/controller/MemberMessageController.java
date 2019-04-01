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
import com.joooin.system.member._27.service.MessageService;

@Controller
public class MemberMessageController {
	@Autowired
	MemberService memberService;
	@Autowired
	MessageService messageService;
	
	@RequestMapping(value = "/member/message", method = RequestMethod.GET)
	public String messageHome(HttpSession session, Model model) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		model.addAttribute("friendList", messageService.getFriendsOnMessagePage(memberId));
		model.addAttribute("myself", memberService.getMemberMainBean(memberId));		
		return "member/self/message/sidebar";
	}
	
	@RequestMapping(value = "/member/message/{hash}", method = RequestMethod.GET)
	public String showMessage(@PathVariable String hash, HttpSession session, Model model) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		MemberMainBean bean = messageService.getFriendMemberMainBean(memberId, hash);
		
		if (bean != null) {
			messageService.setOneFriendMessagesRead(memberId, hash);
			model.addAttribute("friend", bean);
			model.addAttribute("hash", hash);
			model.addAttribute("message", messageService.getOneFriendMessage(hash));
			return "member/self/message/chat";
		} else {
			return null;
		}
	}	
	
	@RequestMapping(value = "/member/message/saveText", method = RequestMethod.POST)
	public @ResponseBody void saveTextMessage(String text, Integer receiveMemberId, String messageHash, HttpSession session) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		messageService.saveTextMessage(memberId, receiveMemberId, messageHash, text);
	}
	
	@RequestMapping(value = "/member/message/setOneMessageRead", method = RequestMethod.POST)
	public @ResponseBody void setOneMessageRead(String messageHash, HttpSession session) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		messageService.setOneMessageRead(memberId, messageHash);
	}
}
