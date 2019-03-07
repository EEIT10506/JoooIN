package com.joooin.system.event._02.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.joooin.model.EventMainBean;
import com.joooin.model.EventMemberBean;
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
	//詳細活動資訊
	@SuppressWarnings("unchecked")
	@RequestMapping("/event/{eventId}")
	public String eventDetail(Model model, @PathVariable("eventId") Integer eventId) {
		EventMainBean event = eventservice.getByEventMainId(eventId);
		System.out.println(event.getEventName());
		Integer typeid = event.getEventTypeId();
		Set<EventMemberBean> eventmember = event.getEventMemberSet();
		Iterator<EventMemberBean> iterator = eventmember.iterator();
		MemberMainBean eventmembers = null;
			while(iterator.hasNext()) {
				Integer memberid = iterator.next().getMemberId();
				eventmembers = eventservice.getByMemberId(memberid);
				 
			}
		int totalmember = eventmember.size();
		EventTypeBean eventtype = eventservice.getByEventTypeId(typeid);
		//System.out.println(typeid);
		model.addAttribute("event", event);
		model.addAttribute("eventtype", eventtype);
		model.addAttribute("totalmember", totalmember);
		model.addAttribute("eventmember", eventmember);
		model.addAttribute("eventmembers", eventmembers);
		return "event/event";
	}
	//詳細活動成員
	@RequestMapping("/event/members/{eventId}")
	public String eventMembers(Model model, @PathVariable("eventId") Integer eventId) {
		EventMainBean event = eventservice.getByEventMainId(eventId);
		System.out.println(event.getEventMemberSet());
		Set<EventMemberBean> eventmember = event.getEventMemberSet();
		model.addAttribute("eventmember", eventmember);
		return "event/event";
	}
	//活動修改
	@RequestMapping("/event/setting/{eventId}")
	public String eventSetting(Model model, @PathVariable("eventId") Integer eventId) {
		EventMainBean event = eventservice.getByEventMainId(eventId);
		System.out.println(event.getEventName());
		model.addAttribute("event", event);
		return "event/event_setting";
	}
	
}
