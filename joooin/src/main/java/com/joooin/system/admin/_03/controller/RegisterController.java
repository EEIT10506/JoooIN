package com.joooin.system.admin._03.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RegisterController {
	
	@RequestMapping("/admin/register")
	public String Registerpage() {
		return "/admin/register";
	}
	
	@RequestMapping("/admin/registerpage")
	public String Register(@RequestParam(value="membername")String membername,
			@RequestParam(value="membername")String email,
			@RequestParam(value="phone")String phone,
			@RequestParam(value="password")String password,
			@RequestParam(value="gender")String gender,
			@RequestParam(value="birthday")String birthday,
			@RequestParam(value="city")String city){
		System.out.println(membername);
		System.out.println(email);
		System.out.println(phone);
		System.out.println(password);
		System.out.println(gender);
		System.out.println(birthday);
		System.out.println(city);
		return "/admin/register";
	}
}