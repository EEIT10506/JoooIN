package com.joooin.system.admin._03.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.joooin.model.EventMainBean;
import com.joooin.model.GroupMainBean;
import com.joooin.model.MemberMainBean;
import com.joooin.repository.EventMainDao;
import com.joooin.repository.GroupMainDao;
import com.joooin.repository.MemberMainDao;
import com.joooin.system.admin._03.model.AllEventQuantityBean;
import com.joooin.system.admin._03.model.AllGroupQuantityBean;
import com.joooin.system.admin._03.model.AllMemberQuantityBean;
import com.joooin.system.admin._03.model.EventMainPojo;
import com.joooin.system.admin._03.model.GroupMainPojo;
import com.joooin.system.admin._03.model.MemberMainPojo;
import com.joooin.system.admin._03.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService service;
	
	@Autowired
	MemberMainDao memberDao;
	
	@Autowired
	GroupMainDao groupDao;
	
	@Autowired
	EventMainDao eventDao;
	
	@RequestMapping("/admin")
	public String admin() {
		return"admin/admin";
	}
	
	@RequestMapping(value = "/admin/getAllMember", method = RequestMethod.GET)
	public @ResponseBody List<MemberMainPojo> getAllMember(){
		List<MemberMainPojo> list = service.getAllMembers();
		return list;
	}
	
	@RequestMapping(value = "/admin/getAllGroup", method = RequestMethod.GET)
	public @ResponseBody List<GroupMainPojo> getAllGroup(){
		List<GroupMainPojo> list = service.getAllGroups();
		return list;
	}
	
	@RequestMapping(value = "/admin/getAllEvent", method = RequestMethod.GET)
	public @ResponseBody List<EventMainPojo> getAllEvent(){
		List<EventMainPojo> list = service.getAllEvents();
		return list;
	}
	
	@RequestMapping(value = "/admin/getMemberBean/{memberId}", method = RequestMethod.GET)
	public @ResponseBody MemberMainBean getMemberBean(@PathVariable("memberId") Integer memberId) {
		MemberMainBean mmb = service.getMemberBean(memberId);
		MemberMainBean newMmb = new MemberMainBean();
		newMmb.setMemberName(mmb.getMemberName());
		newMmb.setEmail(mmb.getEmail());
		return newMmb;
	}
	
	@RequestMapping(value = "/admin/putMember", method = RequestMethod.POST)
	@ResponseBody
	public void putMember(@RequestParam("memberId")Integer memberId,
			@RequestParam("memberName")String memberName,
			@RequestParam("email")String email) {
		MemberMainBean mmb = service.getMemberBean(memberId);
		mmb.setMemberName(memberName);
		mmb.setEmail(email);
		service.putMember(mmb);
	}
	
	@RequestMapping(value = "/admin/deleteMember", method = RequestMethod.POST)
	@ResponseBody
	public void deleteMember(@RequestParam("memberId")Integer memberId) {
		MemberMainBean mmb = service.getMemberBean(memberId);
		service.deleteMemberBean(mmb.getMemberId());
	}
	
	@RequestMapping(value = "/admin/getGroupBean/{groupId}", method = RequestMethod.GET)
	public @ResponseBody GroupMainBean getGroupBean(@PathVariable("groupId")Integer groupId) {
		GroupMainBean gmb = service.getGroupBean(groupId);
		GroupMainBean newGmb = new GroupMainBean();
		newGmb.setGroupName(gmb.getGroupName());
		return newGmb;
	}
	
	@RequestMapping(value = "/admin/deleteGroup", method = RequestMethod.POST)
	@ResponseBody
	public void deleteGroup(@RequestParam("groupId")Integer groupId) {
		GroupMainBean gmb = service.getGroupBean(groupId);
		service.deleteGroupMemberBean(groupId);
		service.deleteGroupChat(groupId);
		service.deleteGroupBean(gmb.getGroupId());
	}
	
	@RequestMapping(value = "/admin/getEventBean/{eventId}", method = RequestMethod.GET)
	public @ResponseBody EventMainBean getEventBean(@PathVariable("eventId")Integer eventId) {
		EventMainBean emb = service.getEventBean(eventId);
		EventMainBean newEmb = new EventMainBean();
		newEmb.setEventName(emb.getEventName());
		return newEmb;
	}
	
	@RequestMapping(value = "/admin/deleteEvent", method = RequestMethod.POST)
	@ResponseBody
	public void deleteEvent(@RequestParam("eventId")Integer eventId) {
		EventMainBean emb = service.getEventBean(eventId);
		service.deleteEventMemberBean(eventId);
		service.deleteEventLike(eventId);
		service.deleteEventPost(eventId);
		service.deleteEventBean(emb.getEventId());
	}
	
	@RequestMapping(value = "/admin/memberPDF", method = RequestMethod.GET)
	public ModelAndView memberPdf() {
		List<MemberMainBean> list = service.getAllMember();
		return new ModelAndView("memberPdfView", "allMember", list);
	}
	
	@RequestMapping(value = "/admin/groupPDF", method = RequestMethod.GET)
	public ModelAndView groupPdf() {
		List<GroupMainBean> list = service.getAllGroup();
		return new ModelAndView("groupPdfView", "allGroup", list);
	}
	
	@RequestMapping(value = "/admin/eventPDF", method = RequestMethod.GET)
	public ModelAndView eventPdf() {
		List<EventMainBean> list = service.getAllEvent();
		return new ModelAndView("eventPdfView", "allEvent", list);
	}
	
	@RequestMapping(value="/admin/memberStatistics",method=RequestMethod.GET)
	public @ResponseBody Map<String, Object> getAllMemberQuantity(){
		List<AllMemberQuantityBean> list = memberDao.getAllMemberQuantity();
		//
		int i=0;
		StringBuffer memberId=new StringBuffer();  
        StringBuffer gender=new StringBuffer();  
        
        for (AllMemberQuantityBean aqb : list) {  
        	memberId.append(aqb.getMemberId());  
        	gender.append(aqb.getGender());   
            //
        	i++;
            if(i<list.size()){  
            	memberId.append(",");  
            	gender.append(",");  
            }  
        }
        
        Map<String, Object> map = new HashMap<String, Object>();
        System.out.println(map);
		System.out.println(memberId);
		System.out.println(gender);
		map.put("members", memberId);
		map.put("gender", gender);
		return map;
		
	}
	
	@RequestMapping(value="/admin/groupStatistics",method=RequestMethod.GET)
	public @ResponseBody Map<String, Object> getAllGroupQuantity(){
		List<AllGroupQuantityBean> list = groupDao.getAllGroupQuantity();
		System.out.println(list);
		//
		int i=0;
		StringBuffer id=new StringBuffer();  
        StringBuffer type=new StringBuffer();  
        
        for (AllGroupQuantityBean agb : list) {  
        	System.out.println("type="+agb.getGroupType());
        	id.append(agb.getGroupId());  
        	type.append(agb.getGroupType());   
            //
        	i++;
            if(i<list.size()){  
            	id.append(",");  
            	type.append(",");  
            }  
        }
        
        Map<String, Object> map = new HashMap<String, Object>();
		System.out.println(id);
		System.out.println(type);
		map.put("groupCurrentMember", id);
		map.put("type", type);
		return map;
		
	}
	
	@RequestMapping(value="/admin/eventStatistics",method=RequestMethod.GET)
	public @ResponseBody Map<String, Object> getAllEventQuantity(){
		List<AllEventQuantityBean> list = eventDao.getAllEventQuantity();
		//
		int i=0;
		StringBuffer id=new StringBuffer();  
        StringBuffer type=new StringBuffer();  
        
        for (AllEventQuantityBean aqb : list) {  
        	id.append(aqb.getEventId());
        	if(aqb.getEventTypeId().equals("1")) {
        		type.append("food"); 
        	}
        	if(aqb.getEventTypeId().equals("2")) {
        		type.append("sport"); 
        	}
        	if(aqb.getEventTypeId().equals("3")) {
        		type.append("entertainment"); 
        	}
        	if(aqb.getEventTypeId().equals("4")) {
        		type.append("other"); 
        	}
            //
        	i++;
            if(i<list.size()){  
            	id.append(",");  
            	type.append(",");  
            }  
        }
        
        Map<String, Object> map = new HashMap<String, Object>();
		System.out.println(id);
		System.out.println(type);
		map.put("eventId", id);
		map.put("eventType", type);
		return map;
	}
}
