package com.joooin.system.member._27.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.joooin.model.MemberMainBean;
import com.joooin.system.member._27.service.MemberService;

@Controller
public class MemberProfileController {
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "/member/updateProfile", method = RequestMethod.POST)
	public String updateProfile(@ModelAttribute("memberMainBean") MemberMainBean updateBean, HttpSession session) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		String memberName = memberService.updateProfile(memberId, updateBean);
		session.setAttribute("memberName", memberName);
		return "redirect:/member/self/profile";	
	}						  
	
	@RequestMapping(value = "/member/updatePassword", method = RequestMethod.POST)
	public String updatePassword(@RequestParam String password1, @RequestParam String password2, HttpSession session) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		if (password1 != null && password2 != null) {
			memberService.updatePassword(password1, password2, memberId);
			return "redirect:/member/self/profile";
		} else {
			return null;
		}
	}
	
	@RequestMapping(value = "/member/updatePrivacy", method = RequestMethod.POST)
	public String updatePrivacy(@ModelAttribute("memberMainBean") MemberMainBean updateBean, HttpSession session) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		memberService.updatePrivacy(memberId, updateBean);		
		return "redirect:/member/self/profile";
	}
	
	@RequestMapping(value = "/member/self/profile", method = RequestMethod.GET)
	public String selfProfile(Model model, HttpSession session) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		model.addAttribute("memberMainBean", memberService.getMemberMainBean(memberId));
		return "member/self/profile";
	}
	
	@RequestMapping(value = "/member/other/profile/{otherMemberId}", method = RequestMethod.GET)
	public String otherProfile(@PathVariable Integer otherMemberId, Model model, HttpSession session) {
		Integer selfMemberId = (Integer)session.getAttribute("memberId");

		if (selfMemberId == null || !selfMemberId.equals(otherMemberId)) {
			MemberMainBean bean = memberService.getMemberMainBean(otherMemberId);
			if (bean != null) {
				model.addAttribute("memberMainBean", bean);
				return "member/other/profile";
			} else {
				return "member/other/no_member";
			}
		} else {
			return "redirect:/member/self/profile";
		}
	}

	

}
