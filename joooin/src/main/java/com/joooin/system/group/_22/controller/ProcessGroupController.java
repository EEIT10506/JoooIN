package com.joooin.system.group._22.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joooin.model.MemberMainBean;
import com.joooin.system.group._22.service.GroupService_22;

@Controller
public class ProcessGroupController {
	@Autowired
	GroupService_22 service;
	@Autowired
	ServletContext context;
	
	@RequestMapping(method = RequestMethod.GET, value = "/group/applygroup/{groupId}")
	@ResponseBody
	public String getGroupApplyList(@PathVariable Integer groupId, Model model) {
		
		List<MemberMainBean> groupApplyList = service.getGroupApplyMembers(groupId);
		
		model.addAttribute("applyList", groupApplyList);
		
		return "";
	}

	@RequestMapping(method = RequestMethod.POST, value =
			"/group/applygroup/{groupId}/member/{memberId}/result/{decide}")
	@ResponseBody
	public String processGroupApply(@PathVariable Integer groupId, 
			@PathVariable Integer memberId, @PathVariable String decide ) {
		
		service.processApplyList(groupId, memberId, decide);
		
		
		
		return "";
	}
	
	
	
}
