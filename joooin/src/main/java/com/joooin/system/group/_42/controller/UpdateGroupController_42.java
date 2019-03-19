package com.joooin.system.group._42.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.joooin.repository.GroupMemberDao;
import com.joooin.system.group._22.service.GroupService_22;
import com.joooin.system.group._42.service.GroupService_42;

@Controller
public class UpdateGroupController_42 {
	@Autowired
	GroupMemberDao groupMemberDao;
	
	@Autowired
	GroupService_42 service;
	
	@Autowired
	GroupService_22 service2;
	
	@Autowired
	ServletContext context;

		

//
			@RequestMapping(value = "group/group_about", method = RequestMethod.GET)
			public String UpdateGroupType() {
				
				return "group/group_about";
			}
			
			@RequestMapping(value = "group/group_about", method = RequestMethod.GET)
			public String UpdateGroupName() {
				
				return "group/group_about";
			}
			
			@RequestMapping(value = "group/group_about", method = RequestMethod.GET)
			public String UpdateGroupIntro() {
				
				return "group/group_about";
			}
			


}