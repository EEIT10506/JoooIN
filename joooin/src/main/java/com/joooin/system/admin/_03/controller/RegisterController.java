package com.joooin.system.admin._03.controller;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.joooin.model.MemberMainBean;
import com.joooin.system.admin._03.service.RegisterService;
import com.joooin.util.RandomStringUtil;

@Controller
public class RegisterController {
	
	@Autowired
	JavaMailSender mailSender;
	
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
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String Register(@ModelAttribute("memberMainBean")MemberMainBean mmb,
			Model model,
			RedirectAttributes redirectAttributes,
			HttpServletRequest request) throws MessagingException{
		String certificationHash = RandomStringUtil.getRandomString();
		mmb.setCertificationHash(certificationHash);
		System.out.println("我是認證"+service.activeUser(certificationHash));
		if(service.activeUser(certificationHash)==true) {
			System.out.println("有認證碼");
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

			helper.setFrom("eeit105joooin@gmail.com");// 發件人
			helper.setTo(mmb.getEmail());// 收件人
			helper.setSubject("<重要> JOOOIN 認證信箱");// 主題
			helper.setText("<html><meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"><body>"
					+ "<h4>您的名稱:" + mmb.getMemberName() + "</h4><br><h4>您的認證網址是"
					+ request.getContextPath()+"/registerEmail"+certificationHash
					+ "。<br><p>joooin團隊敬上</p>" + "</body></html>", true);// 正文
			mailSender.send(message);
			System.out.println("發送完成");
		}
		
		if(service.checkEmail(mmb.getEmail()) != true
				&& mmb.getPassword()!=null && mmb.getPassword().length()!=0
				&& mmb.getMemberName()!=null && mmb.getMemberName().length()!=0
				&& mmb.getBirthday()!=null && mmb.getBirthday().length()!=0
				&& mmb.getPhone()!=null && mmb.getPhone().length()!=0
				&& mmb.getEmail()!=null && mmb.getEmail().length()!=0) {
			redirectAttributes.addFlashAttribute("name", mmb.getMemberName());
			redirectAttributes.addFlashAttribute("welcome", "註冊成功");
			service.save(mmb);
			return "redirect:/login";
		}else if(mmb.getPassword() == null || mmb.getPassword().length()==0) {
			redirectAttributes.addFlashAttribute("error", "註冊失敗，請輸入密碼");
			return "redirect:/register";
		}
		else if(mmb.getMemberName() == null || mmb.getMemberName().length()==0) {
			redirectAttributes.addFlashAttribute("error", "註冊失敗，請輸入會員姓名");
			return "redirect:/register";
		}
		else if(mmb.getBirthday() == null || mmb.getBirthday().length()==0) {
			redirectAttributes.addFlashAttribute("error", "註冊失敗，請輸入生日");
			return "redirect:/register";
		}
		else if(mmb.getPhone() == null || mmb.getPhone().length()==0) {
			redirectAttributes.addFlashAttribute("error", "註冊失敗，請輸入電話");
			return "redirect:/register";
		}
		else if(mmb.getEmail() == null || mmb.getEmail().length()==0) {
			redirectAttributes.addFlashAttribute("error", "註冊失敗，請輸入信箱");
			return "redirect:/register";
		}
		else {
			redirectAttributes.addFlashAttribute("error", "註冊失敗，信箱已經有人使用");
			return "redirect:/register";
		}
		
	}
	
	@RequestMapping(value = "/registerEmail", method = RequestMethod.GET)
	public String registerEmail(RedirectAttributes redirectAttributes,
			MemberMainBean mmb,
			HttpServletRequest request) {
		request.getParameter("code");
		redirectAttributes.addFlashAttribute("welcome", "驗證成功");
		return "redirect:/login";
	}
	
}