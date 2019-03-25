package com.joooin.system.admin._03.controller;

import javax.mail.MessagingException;
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
import com.joooin.system.admin._03.service.RegisterService;

@Controller
public class LoginController {

	@Autowired
	LoginService service;

	@Autowired
	MemberMainDao dao;

	@Autowired
	RegisterService registerService;

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(Model model) {
		MemberMainBean mmb = new MemberMainBean();
		model.addAttribute("memberMainBean", mmb);
		return "admin/login";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginProcess(@ModelAttribute("memberMainBean") MemberMainBean mmb, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {
		HttpSession session = request.getSession();
		MemberMainBean member = null;
		AdminBean admin = null;
		member = service.checkEmailPassword(mmb.getEmail(), mmb.getPassword());
		admin = service.checkAdmin(mmb.getEmail(), mmb.getPassword());

		if (member != null && member.getCertificationStatus() == true) {
			session.setAttribute("memberName", member.getMemberName());
			session.setAttribute("memberId", member.getMemberId());
			Integer logins = member.getLogins() + 1;
			member.setLogins(logins);
			service.update(member);
			session.setAttribute("logout", "登出");
			return "redirect:/";
		}

		if (member != null && member.getCertificationStatus() == false) {
			redirectAttributes.addFlashAttribute("error", member.getMemberName() + "您好，請至信箱收信驗證後才可登入");
			return "redirect:/login";
		}

		if (admin != null) {
			session.setAttribute("admin", admin.getName());
			session.setAttribute("adminId", admin.getAdminId());
			session.setAttribute("logout", "登出");
			return "redirect:/admin";
		} else {
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

	@RequestMapping(value = "forgotEmaiStatus", method = RequestMethod.POST)
	public String forgotEmaiStatus(@ModelAttribute("memberMainBean") MemberMainBean mmb,
			RedirectAttributes redirectAttributes, HttpServletRequest request,
			HttpSession session) throws MessagingException {

		MemberMainBean member = null;
		member = service.checkEmailPassword(mmb.getEmail(), mmb.getPassword());
		System.out.println(member);
		if (member != null) {

			if (member.getCertificationStatus() == true) {
				redirectAttributes.addFlashAttribute("error", "此信箱已經驗證");
				return "redirect:/login";
			}

			if (member.getCertificationStatus() == false) {
				session.setAttribute("AAA", member.getEmail());
				registerService.certification(mmb, request);
				redirectAttributes.addFlashAttribute("error", "已發送驗證信，請至Email查看");
				return "redirect:/login";
			}
		}
		redirectAttributes.addFlashAttribute("error", "信箱或密碼錯誤");
		return "redirect:/login";
	}
}
