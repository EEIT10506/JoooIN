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
public class FriendController {
	@Autowired
	MemberService memberService;
	                       
	@RequestMapping(value = "/member/friendShow", method = RequestMethod.GET)
	public @ResponseBody String friendShow(Integer otherMemberId, HttpSession session) {
		Integer selfMemberId = (Integer)session.getAttribute("memberId");
		
		if (selfMemberId != null) {
			return memberService.checkFriendStatus(selfMemberId, otherMemberId);
		} else {
			return "NOT_FRIEND";
		}
	}
	 
	@RequestMapping(value = "/member/friendProcess", method = RequestMethod.POST)
	public @ResponseBody String friendProcess(Integer otherMemberId, String process, HttpSession session) {
		Integer selfMemberId = (Integer)session.getAttribute("memberId");
		
		if (selfMemberId != null) {
			memberService.friendProcess(selfMemberId, otherMemberId, process);
			return null;
		} else {
			return "not_login";
		}
	}
	
	@RequestMapping(value = "/member/self/friend/{link}", method = RequestMethod.GET)
	public String getFriends(@PathVariable String link, HttpSession session, Model model) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		if (memberId != null) {
			model.addAttribute("friendList", memberService.getFriends(memberId));
			return "member/self/friend/" + link;
		} else {
			return "not_Login";
		}	
	}

}
