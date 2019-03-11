package com.joooin.system.member._27.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.joooin.model.MemberMainBean;
import com.joooin.system.member._27.service.MemberService;

@Controller
public class ProfileController {
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "/member/updateProfile", method = RequestMethod.POST)
	public String updateProfile(@ModelAttribute("memberMainBean") MemberMainBean updateBean, HttpSession session) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		if (memberId != null) {
			MemberMainBean mmb = memberService.getMemberMainBean(memberId);
			mmb.setMemberName(updateBean.getMemberName());
			mmb.setBirthday(updateBean.getBirthday());
			mmb.setCity(updateBean.getCity());
			mmb.setPhone(updateBean.getPhone());
			memberService.updateMemberMainBean(mmb);
			
			return "redirect:/member/profile";
		} else {
			return "not_login";
		}
		
	}						  
	@RequestMapping(value = "/member/updatePassword", method = RequestMethod.POST)
	public String updatePassword(HttpSession session, HttpServletRequest request) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		if (memberId != null) {
			String password1 = request.getParameter("password1");
			String password2 = request.getParameter("password2");
			
			if (password1.equals(password2)) {
				MemberMainBean mmb = memberService.getMemberMainBean(memberId);
				mmb.setPassword(password1);
				memberService.updateMemberMainBean(mmb);
				return "redirect:/member/profile";
			} else {
				return null;
			}
		} else {
			return "not_login";
		}
	}


}
