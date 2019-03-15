package com.joooin.system.group._42.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.joooin.model.GroupMainBean;
import com.joooin.model.GroupMemberBean;
import com.joooin.repository.GroupMemberDao;
import com.joooin.system.group._22.service.GroupService_22;
import com.joooin.system.group._42.service.GroupService_42;

@Controller
public class GroupController_42 {
	@Autowired
	GroupMemberDao groupMemberDao;
	
	@Autowired
	GroupService_42 service;
	
	@Autowired
	GroupService_22 service2;
	
	@Autowired
	ServletContext context;
	@RequestMapping(method = RequestMethod.GET, value = "/groups/groups_type")
	public String getGrouptypeAll(Model model) {
		List<GroupMainBean> list =service.getAll();
		model.addAttribute("groupsType", list);
		return "group/groups_type"; 
	}
	//加判斷是否為group會員顯示前端加入社團 進入社團
	@RequestMapping(method = RequestMethod.GET, value = "/groups/{grouponetype}")
	public String getGroupTypeOne(@PathVariable("grouponetype") String groupOneType ,Model model, HttpSession session,Integer groupId) {

		Integer memId = (Integer) session.getAttribute("memberId");	
		List<GroupMemberBean> groupList = groupMemberDao.getAll();
		
		List<GroupMainBean> typeOne = service.getGroupType(groupOneType);
		model.addAttribute("groupsType", typeOne);
		
		List<GroupMainBean> list = service.getGroupType(groupOneType);
		for(GroupMainBean gb:list) {
//有功能尚未做完
//			for(GroupMemberBean gm:groupList) {
			if(service2.isInGroup(gb.getGroupId(), memId)) {
				model.addAttribute("isInGroup","進入社團" );
				}
			else{
				
				service2.isInGroup(gb.getGroupId(),memId );
				model.addAttribute("isInGroup","加入社團" );
					return "redirect:/group/"+ groupId;
				}	
			}
//			}
		

		return "group/groups_type"; 
	}
}
