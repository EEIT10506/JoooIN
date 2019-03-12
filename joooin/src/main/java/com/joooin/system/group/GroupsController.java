package com.joooin.system.group;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.joooin.model.GroupMainBean;
import com.joooin.system.group._42.service.GroupService;

@Controller
public class GroupsController {
	
	@RequestMapping(method = RequestMethod.GET, value = "/groups")
	public String homepage() {
		return "group/groups";
	}
	@Autowired
	GroupService service;
	@RequestMapping(method = RequestMethod.GET, value = "/group/groupstype")
	public String getgrouptypeAll(Model model) {
		service.getAll();
		return "group/groupstype"; 
	}

	@RequestMapping(method = RequestMethod.GET, value = "/group/{grouponetype}")
	public String getgrouptypeone(@PathVariable("grouponetype") String grouponetype ,Model model) {
		List<GroupMainBean> typeone=service.getgrouptype(grouponetype);
		model.addAttribute("groupstype", typeone);
		return "group/groupstype";
	}
}
