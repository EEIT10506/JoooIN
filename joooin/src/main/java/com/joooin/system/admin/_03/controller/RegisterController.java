package com.joooin.system.admin._03.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.joooin.model.MemberMainBean;

@Controller
public class RegisterController {
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String Registerpage(Model model) {
		MemberMainBean mmb = new MemberMainBean();
		model.addAttribute("memberMainBean", mmb);
		return "/admin/register";
	}
	
	@RequestMapping(value = "/registerProcess", method = RequestMethod.POST)
	public String Register(@ModelAttribute("memberMainBean")MemberMainBean mmb){
		
		return "/admin/register";
	}
}