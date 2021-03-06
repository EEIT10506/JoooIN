package com.joooin.system.group._42.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.joooin.model.GroupMainBean;
import com.joooin.model.MemberMainBean;
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

	@RequestMapping(value = "/group/abouts/updateGroupType/{groupId}", method = RequestMethod.POST)
	public String updateGroupType(	 String type,
			@PathVariable("groupId") Integer groupId) {
		
		service.updateGroupType(groupId, type);
		
		return "redirect:/group/about/" + groupId;
	

	}
	@RequestMapping(value = "/group/abouts/updateGroupName/{groupId}", method = RequestMethod.POST)
	public String updateGroupName(	 String groupname,
			@PathVariable("groupId") Integer groupId) {
		service.updateGroupName(groupId, groupname);
		return "redirect:/group/about/" + groupId;
	}
	
	@RequestMapping(value = "/group/abouts/updateGroupIntro/{groupId}", method = RequestMethod.POST)
	public String updateGroupIntro(	 String groupintro,
			@PathVariable("groupId") Integer groupId) {
		service.updateGroupIntro(groupId, groupintro);
		return "redirect:/group/about/" + groupId;
	}
	
}