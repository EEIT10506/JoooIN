package com.joooin.system.group._22.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.joooin.system.group._22.service.GroupNotification;
import com.joooin.system.group._22.service.GroupService_22;

@Controller
public class DeleteGroupController {

	@Autowired
	GroupService_22 service;
	
	@Autowired
	GroupNotification notifGroup;
	
	
	@RequestMapping(method = RequestMethod.POST, value = "/group/{groupId}/members/delete/{memberId}")
	public String deleteGroupMember(Model model, @PathVariable Integer groupId, @PathVariable Integer memberId) {
		if(groupId != null && memberId != null)
			
		service.removeGroupMember(groupId, memberId);
		
		notifGroup.groupNotifReject(memberId, groupId);
		
		return "redirect:/group/members/" + groupId;
	}
}
