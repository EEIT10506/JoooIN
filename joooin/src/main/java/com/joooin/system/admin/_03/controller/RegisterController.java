package com.joooin.system.admin._03.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.joooin.model.MemberMainBean;
import com.joooin.system.admin._03.service.RegisterService;

@Controller
public class RegisterController {
	
	@Autowired
	RegisterService service;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String Registerpage(Model model) {
		MemberMainBean mmb = new MemberMainBean();
		model.addAttribute("memberMainBean", mmb);
		return "/admin/register";
	}
	
	@RequestMapping(value = "/registerProcess", method = RequestMethod.POST)
	public String Register(@ModelAttribute("memberMainBean")MemberMainBean mmb){
		if(mmb!=null) {
			System.out.println("no null");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd ahh:mm:ss");
			mmb.setMemberCreateDate(sdf.format(new Date()).toString());
			mmb.setMemberImage(new Byte[] {1});
			service.save(mmb);
		}else {
			System.out.println("null");
		}
		
		
		return "redirect:/register";
	}
}