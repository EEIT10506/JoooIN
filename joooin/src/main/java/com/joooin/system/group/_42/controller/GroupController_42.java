package com.joooin.system.group._42.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.joooin.model.GroupMainBean;
import com.joooin.system.group._42.service.GroupService_42;

@Controller
public class GroupController_42 {
	@Autowired
	GroupService_42 service;
	
	@Autowired
	ServletContext context;
	@RequestMapping(method = RequestMethod.GET, value = "/groups/groups_type")
	public String getGrouptypeAll(Model model) {
		List<GroupMainBean> list =service.getAll();
		model.addAttribute("groupsType", list);
		return "group/groups_type"; 
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/groups/{grouponetype}")
	public String getGroupTypeOne(@PathVariable("grouponetype") String groupOneType ,Model model) {
		List<GroupMainBean> typeOne = service.getGroupType(groupOneType);
		model.addAttribute("groupsType", typeOne);
		return "group/groups_type";
	}
}
