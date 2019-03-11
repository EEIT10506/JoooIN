package com.joooin.system.group;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class GroupsController {
	
	@RequestMapping(method = RequestMethod.GET, value = "/groups")
	public String homepage() {
		return "group/groups";
	}
	@RequestMapping(method = RequestMethod.GET, value = "/group/groupstype")
	public String getgrouptypeAll() {
		return "group/groupstype";
	}
}
