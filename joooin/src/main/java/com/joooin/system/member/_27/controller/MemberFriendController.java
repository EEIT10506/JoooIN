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
public class MemberFriendController {
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
	public @ResponseBody void friendProcess(Integer otherMemberId, String process, HttpSession session) {
		Integer selfMemberId = (Integer)session.getAttribute("memberId");
		memberService.friendProcess(selfMemberId, otherMemberId, process);
	}
	                         
	@RequestMapping(value = "/member/self/friend/{link}", method = RequestMethod.GET)
	public String getFriends(@PathVariable String link, HttpSession session, Model model) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		model.addAttribute("friendList", memberService.getFriendsOnFriendPage(memberId));
		return "member/self/friend/" + link;
	}
	
	@RequestMapping(value = "/member/other/friend/{otherMemberId}", method = RequestMethod.GET)
	public String otherFriend( @PathVariable Integer otherMemberId, Model model, HttpSession session) {
		Integer selfMemberId = (Integer)session.getAttribute("memberId");
		
		if (selfMemberId == null || !selfMemberId.equals(otherMemberId)) {
			model.addAttribute("memberMainBean", memberService.getMemberMainBean(otherMemberId));
			model.addAttribute("friendList", memberService.getFriendsOnFriendPage(otherMemberId));
			return "member/other/friend";
		} else {
			return "redirect:/member/self/friend/my_friend";
		}
	}

}
