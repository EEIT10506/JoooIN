package com.joooin.system.admin._03.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;

import org.apache.commons.lang3.ArrayUtils;
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
		if(mmb!=null) {
			System.out.println("no null");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd ahh:mm:ss");
			mmb.setMemberCreateDate(sdf.format(new Date()).toString());
			String m = "male";
			String f = "female";
			
			if(mmb.getGender().equals(m)) {
				ByteArrayOutputStream baos = new ByteArrayOutputStream();
				System.out.println("male");
				String filePath = "/WEB-INF/resources/img/member_male.PNG";
				String root = context.getRealPath("/");
				root = root.substring(0, root.length()-1);
				String fileLoction = root + filePath;
				byte[] b = null;
				File file = new File(fileLoction);
				BufferedImage bi;
				try {
					bi = ImageIO.read(file);
					ImageIO.write(bi, "png", baos);
					b = baos.toByteArray();
					baos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
					Byte[] B = ArrayUtils.toObject(b);
					mmb.setMemberImage(B);
					service.save(mmb);
			}
			if(mmb.getGender().equals(f)) {
				ByteArrayOutputStream baos = new ByteArrayOutputStream();
				System.out.println("female");
				String filePath = "/WEB-INF/resources/img/member_female.PNG";
				String root = context.getRealPath("/");
				root = root.substring(0, root.length()-1);
				String fileLoction = root + filePath;
				byte[] b = null;
				File file = new File(fileLoction);
				BufferedImage bi;
				try {
					bi = ImageIO.read(file);
					ImageIO.write(bi, "png", baos);
					b = baos.toByteArray();
					baos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
					Byte[] B = ArrayUtils.toObject(b);
					mmb.setMemberImage(B);
					service.save(mmb);
			}
			
		}else {
			System.out.println("null");
		}
		/**
		 * redirectAttributes.addFlashAttribute
		 * 將redirect物件有效化回傳到指定程式
		 */
		redirectAttributes.addFlashAttribute("name", mmb.getMemberName());
		redirectAttributes.addFlashAttribute("welcome", "註冊成功");
		return "redirect:/login";
	}
}