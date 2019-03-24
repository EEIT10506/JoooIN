package com.joooin.system.member._27.controller;


import javax.servlet.ServletContext;
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
	@Autowired
	ServletContext context;
	
	@RequestMapping(value = "/member/updateProfile", method = RequestMethod.POST)
	public String updateProfile(@ModelAttribute("memberMainBean") MemberMainBean updateBean, HttpSession session) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		if (memberId != null) {
			String memberName = memberService.updateProfile(memberId, updateBean, context);
			session.setAttribute("memberName", memberName);
			return "redirect:/member/self/profile";
		} else {
			return "not_login";
		}	
	}						  
	
	@RequestMapping(value = "/member/updatePassword", method = RequestMethod.POST)
	public String updatePassword(@RequestParam String password1, @RequestParam String password2, HttpSession session) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		if (memberId != null) {
			if (password1 != null && password2 != null) {
				memberService.updatePassword(password1, password2, memberId);
				return "redirect:/member/self/profile";
			} else {
				return null;
			}
		} else {
			return "not_login";
		}
	}
	
	@RequestMapping(value = "/member/updatePrivacy", method = RequestMethod.POST)
	public String updatePrivacy(@ModelAttribute("memberMainBean") MemberMainBean updateBean, HttpSession session) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		if (memberId != null) {
			memberService.updatePrivacy(memberId, updateBean);
			return "redirect:/member/self/profile";
		} else {
			return "not_login";
		}	
	}
	
	@RequestMapping(value = "/member/self/profile", method = RequestMethod.GET)
	public String selfProfile(Model model, HttpSession session) {
		Integer memberId = (Integer)session.getAttribute("memberId");

		if (memberId != null) {
			model.addAttribute("memberMainBean", memberService.getMemberMainBean(memberId));
			return "member/self/profile";
		} else {
			return "not_login";
		}
	}
	
	@RequestMapping(value = "/member/other/profile/{otherMemberId}", method = RequestMethod.GET)
	public String otherProfile(@PathVariable Integer otherMemberId, Model model, HttpSession session) {
		Integer selfMemberId = (Integer)session.getAttribute("memberId");

		if (selfMemberId == null || !selfMemberId.equals(otherMemberId)) {
			model.addAttribute("memberMainBean", memberService.getMemberMainBean(otherMemberId));
			return "member/other/profile";
		} else {
			return "redirect:/member/self/profile";
		}
	}

	

}
