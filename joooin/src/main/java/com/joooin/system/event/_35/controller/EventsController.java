package com.joooin.system.event._35.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.joooin.model.EventMainBean;

@Controller
public class EventsController {
	
	@RequestMapping(value = "/events", method = RequestMethod.GET)
	public String eventspage(Model model) {
		EventMainBean event = new EventMainBean();
		return "event/events";
	}
}
