package com.joooin.system.group;

import java.time.LocalDateTime;
import java.util.List;
import javax.servlet.ServletContext;
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
	@Autowired
	GroupService service;
	
	@Autowired
	ServletContext context;
	
	@RequestMapping(method = RequestMethod.GET, value = "/groups")
	public String groupPage() {
		return "group/groups";
	}
	@RequestMapping(method = RequestMethod.GET, value = "/group/groupstype")
	public String getgrouptypeAll(Model model) {
		service.getAll();
		return "group/groupstype"; 
	}

	@RequestMapping(method = RequestMethod.GET, value = "/group/{grouponetype}")
	public String getgrouptypeone(@PathVariable("grouponetype") String grouponetype ,Model model) {
		List<GroupMainBean> typeone = service.getgrouptype(grouponetype);
		model.addAttribute("groupstype", typeone);
		return "group/groupstype";
	}
	
	
	//送出空白社團表單
	@RequestMapping(method = RequestMethod.GET, value = "/group/create")
	public String getNewGroupForm(Model model) {
		GroupMainBean groupMainBean = new GroupMainBean();
		//要更改格式
		groupMainBean.setGroupCreateDate(LocalDateTime.now().toString());
		model.addAttribute("groupMainBean", groupMainBean);
		return "group/group_create";
	}
	
	//處理新增表單
//	@RequestMapping(method = RequestMethod.POST, value = "/group/create")
//	public String processNewGroupForm(@ModelAttribute("groupMainBean") GroupMainBean groupMainBean,
//			BindingResult bResult) {
//		//bResult待加入白名單功能
//		
//		//若未提供圖片，使用預設圖片
//		
//		service.createGroup(groupMainBean);
//		
//		return "redirect:/groups";
//	}
}
