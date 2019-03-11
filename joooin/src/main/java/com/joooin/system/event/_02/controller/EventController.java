package com.joooin.system.event._02.controller;



import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.joooin.model.EventMainBean;
import com.joooin.model.EventMemberBean;
import com.joooin.model.EventPostBean;
import com.joooin.model.EventTypeBean;
import com.joooin.model.MemberMainBean;
import com.joooin.system.event._02.service.EventService;


@Controller
public class EventController {
	@Autowired
	EventService eventservice;
	 
	//主頁面進入前
	@RequestMapping("/event")
	public String test(Model model, HttpSession session) {
		session.setAttribute("eventId", 2);
		
		return "event/event";
	}
	@RequestMapping(value = "/event/eventPost", method = RequestMethod.POST)
	public String submitEventPost(@RequestParam Integer eventId, @RequestParam Integer memberId, @RequestParam String eventPostContent) {
		
		EventPostBean eventPostBean = new EventPostBean(); 
		eventPostBean.setEventId(eventId);		
		eventPostBean.setMemberId(memberId);
		eventPostBean.setEventPostContent(eventPostContent);
		
		Date date = new Date();
		SimpleDateFormat time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String eventPostDate =time.format(date);
		
		eventPostBean.setEventPostDate(eventPostDate);
		eventPostBean.setIsDeleted(false);
		
		Integer eventPostId = eventservice.saveOneEventPost(eventPostBean);
		
		
		return "redirect:/event/"+eventId;
		
	}
	
	
	//	@RequestMapping(value="/event/{eventId}", method = RequestMethod.GET)
//	public String addNewEventPost(Model model) {
//		EventPostBean eventPostBean = new EventPostBean();
//		model.addAttribute("PostMessage", eventPostBean);
//		
//		return "/event/event";
//		
//	}
//	@RequestMapping(value="/event/{eventId}", method = RequestMethod.POST)
//	public String addEventPost(@ModelAttribute("PostMessage") EventPostBean eventPostBean,@RequestParam Integer eventId) {
//		
//		
//		return "redirect:/event/event/"+eventId;
//		
//	}
	//詳細活動資訊 & 成員 click button 才帶資料顯示
	
	@RequestMapping("/event/{eventId}")
	public String eventDetail(Model model, @PathVariable("eventId") Integer eventId) {
		EventMainBean event = eventservice.getByEventMainId(eventId);
		Integer typeid = event.getEventTypeId();
		Integer inviterid = event.getEventInviterId();

		EventTypeBean eventtype = eventservice.getByEventTypeId(typeid);
		MemberMainBean eventbuildname = eventservice.getByMemberId(inviterid);
		
		Set<EventMemberBean> eventmember = event.getEventMemberSet();
		//int totalmember = eventmember.size();
		MemberMainBean eventmembers = null;
		Set<MemberMainBean> eventmemberset =new HashSet<MemberMainBean>();
		for(EventMemberBean members: eventmember) {
			Integer memberid = members.getMemberId();
			eventmembers  = eventservice.getByMemberId(memberid);
			eventmemberset.add(eventmembers);
		}
		
		List<EventPostBean> eventPost = event.getEventPostSet();
		
		MemberMainBean eventPostMember = null;
		List<MemberMainBean> eventPostMemberList = new ArrayList<MemberMainBean>();
		for(EventPostBean postMember: eventPost) {
			Integer postMemberId = postMember.getMemberId();
			 eventPostMember = eventservice.getByMemberId(postMemberId);
			 eventPostMemberList.add(eventPostMember);
		}
		
		
		model.addAttribute("event", event);
		model.addAttribute("eventtype", eventtype);
		model.addAttribute("eventbuildname", eventbuildname);
//		model.addAttribute("totalmember", totalmember);
		model.addAttribute("eventmember", eventmember);
		model.addAttribute("eventmembers", eventmemberset);
		model.addAttribute("eventPost", eventPost);
		model.addAttribute("eventPostMemberList", eventPostMemberList);
		
		return "event/event";
	}
	//活動修改
	@RequestMapping("/event/setting/{eventId}")
	public String eventSetting(Model model, @PathVariable("eventId") Integer eventId,Session session) {
//		EventMainBean event = eventservice.getByEventMainId(eventId);
////		memberId
//		Integer typeid = event.getEventTypeId();
//		EventTypeBean eventtype = eventservice.getByEventTypeId(typeid);
//		String eventType = eventtype.getEventType();
//		model.addAttribute("event", event);
//		model.addAttribute("eventtype", eventtype);
		return "event/event_setting";
	}
	
}
