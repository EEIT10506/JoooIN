package com.joooin.system.admin._03.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joooin.model.EventMainBean;
import com.joooin.model.EventMemberBean;
import com.joooin.model.GroupMainBean;
import com.joooin.model.GroupMemberBean;
import com.joooin.model.MemberMainBean;
import com.joooin.system.admin._03.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService service;
	
	@RequestMapping("/admin")
	public String admin() {
		return"admin/admin";
	}
	
	@RequestMapping(value = "/admin/getAllMember", method = RequestMethod.GET)
	public @ResponseBody List<MemberMainBean> getAllMember(){
		List<MemberMainBean> list = service.getAllMember();
		return list;
	}
	
	@RequestMapping(value = "/admin/getAllGroup", method = RequestMethod.GET)
	public @ResponseBody List<GroupMainBean> getAllGroup(){
		List<GroupMainBean> list = service.getAllGroup();
		return list;
	}
	
	@RequestMapping(value = "/admin/getAllEvent", method = RequestMethod.GET)
	public @ResponseBody List<EventMainBean> getAllEvent(){
		List<EventMainBean> list = service.getAllEvent();
		return list;
	}
	
	@RequestMapping(value = "/admin/getMemberBean/{memberId}", method = RequestMethod.GET)
	public @ResponseBody MemberMainBean getMemberBean(@PathVariable("memberId") Integer memberId) {
		return service.getMemberBean(memberId);
	}
	
	@RequestMapping(value = "/admin/deleteMember", method = RequestMethod.POST)
	@ResponseBody
	public void deleteMember(@RequestParam("memberId")Integer memberId) {
		MemberMainBean mmb = service.getMemberBean(memberId);
		service.deleteMemberBean(mmb.getMemberId());
	}
	
	@RequestMapping(value = "/admin/getGroupBean/{groupId}", method = RequestMethod.GET)
	public @ResponseBody GroupMainBean getGroupBean(@PathVariable("groupId")Integer groupId) {
		return service.getGroupBean(groupId);
	}
	
	@RequestMapping(value = "/admin/deleteGroup", method = RequestMethod.POST)
	@ResponseBody
	public void deleteGroup(@RequestParam("groupId")Integer groupId) {
		GroupMainBean gmb = service.getGroupBean(groupId);
		GroupMemberBean gmemberb = service.getGroupMemberBean(groupId);
		service.deleteGroupMemberBean(gmemberb.getGroupMemberId());
		service.deleteGroupBean(gmb.getGroupId());
	}
	
	@RequestMapping(value = "/admin/getEventBean/{eventId}", method = RequestMethod.GET)
	public @ResponseBody EventMainBean getEventBean(@PathVariable("eventId")Integer eventId) {
		return service.getEventBean(eventId);
	}
	
	@RequestMapping(value = "/admin/deleteEvent", method = RequestMethod.POST)
	@ResponseBody
	public void deleteEvent(@RequestParam("eventId")Integer eventId) {
		EventMainBean emb = service.getEventBean(eventId);
		EventMemberBean ememberb = service.getEventMemberBean(eventId);
		service.deleteEventMemberBean(ememberb.getEventMemberId());
		service.deleteEventBean(emb.getEventId());
	}

}
