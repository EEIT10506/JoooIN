package com.joooin.system.admin._03.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.joooin.model.AdminBean;
import com.joooin.model.MemberMainBean;
import com.joooin.repository.MemberMainDao;
import com.joooin.system.admin._03.service.LoginService;

@Controller
public class LoginController {

	@Autowired
	LoginService service;
	
	@Autowired
	MemberMainDao dao;

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(Model model) {
		MemberMainBean mmb = new MemberMainBean();
		model.addAttribute("memberMainBean", mmb);
		return "admin/login";
	}

	@RequestMapping(value = "loginProcess", method = RequestMethod.POST)
	public String loginProcess(@ModelAttribute("memberMainBean") MemberMainBean mmb, HttpServletRequest request
			,RedirectAttributes redirectAttributes) {
		HttpSession session = request.getSession();
		MemberMainBean member = null;
		AdminBean admin = null;
		String adm = "admin@admin";
		
		member = service.checkIDPassword(mmb.getEmail(), mmb.getPassword());
		if(member != null) {
			session.setAttribute("memberName", member.getMemberName());
			session.setAttribute("memberId", member.getMemberId());
			Integer logins = member.getLogins() + 1;
			member.setLogins(logins);
			service.update(member);
			session.setAttribute("logout", "登出");
			return "redirect:/";
		}
		admin = service.check(mmb.getEmail());
		if(mmb.getEmail().equals(adm) && admin!=null){
			session.setAttribute("admin", admin.getName());
			session.setAttribute("adminId", admin.getAdminId());
			session.setAttribute("logout", "登出");
			return "redirect:/admin";
		}
		else {
			redirectAttributes.addFlashAttribute("error", "請檢查信箱密碼是否正確");
			return "redirect:/login";
		}
	}
	@RequestMapping("logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}
}
