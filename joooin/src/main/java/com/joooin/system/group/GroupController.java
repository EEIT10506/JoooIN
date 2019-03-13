package com.joooin.system.group;

import java.time.LocalDateTime;
import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.joooin.model.GroupMainBean;
import com.joooin.system.group.service.GroupService;


@Controller
public class GroupController {
	@Autowired
	GroupService service;
	
	@Autowired
	ServletContext context;
	
	@RequestMapping(method = RequestMethod.GET, value = "/groups")
	public String groupPage() {
		return "group/groups";
	}
	@RequestMapping(method = RequestMethod.GET, value = "/group/groups_type")
	public String getGrouptypeAll(Model model) {
		List<GroupMainBean> list =service.getAll();
		model.addAttribute("groups_type", list);
		return "group/groups_type"; 
	}

	@RequestMapping(method = RequestMethod.GET, value = "/group/{grouponetype}")
	public String getGroupTypeOne(@PathVariable("grouponetype") String groupOneType ,Model model) {
		List<GroupMainBean> typeOne = service.getGroupType(groupOneType);
		model.addAttribute("groupsType", typeOne);
		return "group/groups_type";
	}

	@RequestMapping(method = RequestMethod.GET, value = "/group/group")
	public String groupMainPage() {
		return "group/group";
	}
}
