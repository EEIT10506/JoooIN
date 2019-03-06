package com.joooin.system.event._02.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class EventController {
	
	@RequestMapping("/event/{eventId}")
	public String event(Model model, @PathVariable("eventId") String eventId, HttpServletRequest request) {
		
		
		return "event";
	}
	
}
