package com.joooin.system.event._02.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.joooin.model.EventMainBean;
import com.joooin.system.event._02.service.EventService;

@Controller
public class EventController {
	@Autowired
	EventService service;
	
	@RequestMapping("/event")
	public String test(Model model, HttpSession session) {
		session.setAttribute("eventId", 2);
		
		return "event/event";
	}
	
	@RequestMapping("/event/{eventId}")
	public String event(Model model, @PathVariable("eventId") Integer eventId) {
		EventMainBean event = service.getByEventMainId(eventId);
		System.out.println(event.getEventName());
		model.addAttribute("event", event);
		return "event/event";
	}
	
}
