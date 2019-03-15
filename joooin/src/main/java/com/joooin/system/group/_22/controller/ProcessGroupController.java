package com.joooin.system.group._22.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.joooin.system.group._22.service.GroupService_22;

@Controller
public class ProcessGroupController {
	@Autowired
	GroupService_22 service;
	@Autowired
	ServletContext context;
	
	@RequestMapping(method = RequestMethod.GET, value = "/group/addgroup/{groupId}")
	public String getGroupApplyList() {
		
		return "";
	}

	@RequestMapping(method = RequestMethod.GET, value = "/group/addgroup/{groupId}")
	public String processGroupApply() {
		
		if("inputString".equals("accept")) {
			// update isAgreed
		}
		else {
			// delete bean
		}
		
		return "";
	}
	
	
	
}
