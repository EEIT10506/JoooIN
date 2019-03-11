package com.joooin.system.admin._03.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.joooin.model.MemberMainBean;
import com.joooin.system.admin._03.service.RegisterService;

@Controller
public class RegisterController {
	
	@Autowired
	ServletContext context;
	
	@Autowired
	RegisterService service;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String Registerpage(Model model) {
		MemberMainBean mmb = new MemberMainBean();
		model.addAttribute("memberMainBean", mmb);
		return "/admin/register";
	}
	
	@RequestMapping(value = "/registerProcess", method = RequestMethod.POST)
	public String Register(@ModelAttribute("memberMainBean")MemberMainBean mmb,
			Model model,
			RedirectAttributes redirectAttributes){
		if(service.checkEmail(mmb.getEmail()) != true) {
			redirectAttributes.addFlashAttribute("name", mmb.getMemberName());
			redirectAttributes.addFlashAttribute("welcome", "註冊成功");
			service.save(mmb);
			return "redirect:/login";
		}else {
			redirectAttributes.addFlashAttribute("error", "註冊失敗，信箱已有人使用");
			return "redirect:/register";
		}
		
		
		
	}
}