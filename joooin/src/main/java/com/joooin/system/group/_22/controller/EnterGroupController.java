package com.joooin.system.group._22.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.joooin.model.GroupMainBean;
import com.joooin.system.group._22.service.GroupService_22;

@Controller
public class EnterGroupController {

	@Autowired
	GroupService_22 service;

	@Autowired
	ServletContext context;

	// 依照groupId個別社團主頁連結
	@RequestMapping(method = RequestMethod.GET, value = "/group/{groupId}")
	public String groupMainPage(Model model, @PathVariable Integer groupId) {

		GroupMainBean groupBean = service.getByGroupId(groupId);
		model.addAttribute("groupMain", groupBean);
		return "group/group";

	}

}
