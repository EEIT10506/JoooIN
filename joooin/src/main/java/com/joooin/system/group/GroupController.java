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
import com.joooin.model.MemberMainBean;
import com.joooin.system.group._22.service.GroupService_22;
import com.joooin.system.group._42.service.GroupService_42;
import com.joooin.system.group.service.GroupService;

@Controller
public class GroupController {
	@Autowired
	GroupService service;

	@Autowired
	GroupService_22 groupService22;

	@Autowired
	GroupService_42 groupService42;

	@Autowired
	ServletContext context;

	// 回社團主頁
	@RequestMapping(method = RequestMethod.GET, value = "/groups")
	public String groupPage(Model model) {

		Integer all = groupService42.getAll().size();
		Integer sport = groupService42.getGroupType("sport").size();
		Integer food = groupService42.getGroupType("food").size();
		Integer entertainment = groupService42.getGroupType("entertainment").size();
		Integer other = groupService42.getGroupType("other").size();

		model.addAttribute("all", all);
		model.addAttribute("sport", sport);
		model.addAttribute("food", food);
		model.addAttribute("entertainment", entertainment);
		model.addAttribute("other", other);
		
		return "group/groups";
	}

}
