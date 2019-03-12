package com.joooin.system.member._27.controller;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.joooin.model.MemberMainBean;
import com.joooin.system.member._27.service.MemberService;
import com.joooin.util.ImageUtils;

@Controller
public class ProfileController {
	@Autowired
	MemberService memberService;
	@Autowired
	ServletContext context;
	
	@RequestMapping(value = "/member/my/updateProfile", method = RequestMethod.POST)
	public String updateProfile(@ModelAttribute("memberMainBean") MemberMainBean updateBean, HttpSession session) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		if (memberId != null) {
			MemberMainBean mmb = memberService.getMemberMainBean(memberId);
			mmb.setMemberName(updateBean.getMemberName());
			mmb.setBirthday(updateBean.getBirthday());
			mmb.setCity(updateBean.getCity());
			mmb.setPhone(updateBean.getPhone());
			
			Byte[] memberImage = null;
			if (!updateBean.getMultipartFile().isEmpty()) {
				memberImage = ImageUtils.multipartFileToByteArray(updateBean.getMultipartFile());
				mmb.setMemberImage(memberImage);
			} /*else {
				mmb.setMemberImage(ImageUtils.localImageToByteArray("member_male.PNG", context));
			}*/
			memberService.updateMemberMainBean(mmb);
			session.setAttribute("memberName", mmb.getMemberName());
			
			return "redirect:/member/my/profile";
		} else {
			return "not_login";
		}	
	}						  
	@RequestMapping(value = "/member/my/updatePassword", method = RequestMethod.POST)
	public String updatePassword(@RequestParam String password1, @RequestParam String password2, HttpSession session) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		if (memberId != null) {
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
	@RequestMapping(value = "/member/my/updatePrivacy", method = RequestMethod.POST)
	public String updatePrivacy(@ModelAttribute("memberMainBean") MemberMainBean updateBean, HttpSession session) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		if (memberId != null) {
			MemberMainBean mmb = memberService.getMemberMainBean(memberId);
			mmb.setGenderDisplay(updateBean.getGenderDisplay());
			mmb.setBirthdayDisplay(updateBean.getBirthdayDisplay());
			mmb.setCityDisplay(updateBean.getCityDisplay());
			mmb.setEmailDisplay(updateBean.getEmailDisplay());
			mmb.setPhoneDisplay(updateBean.getPhoneDisplay());
			memberService.updateMemberMainBean(mmb);
			
			return "redirect:/member/profile";
		} else {
			return "not_login";
		}	
	}
	


}
