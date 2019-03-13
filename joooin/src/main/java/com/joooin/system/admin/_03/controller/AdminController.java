package com.joooin.system.admin._03.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joooin.model.MemberMainBean;
import com.joooin.system.admin._03.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService service;
	
	@RequestMapping("/admin")
	public String admin() {
		return"admin/admin";
	}
	
	@RequestMapping(value = "/getAllMember", method = RequestMethod.GET)
	public @ResponseBody List<MemberMainBean> getAllMember(){
		List<MemberMainBean> list = service.getAllMember();
		return list;
	}

}
