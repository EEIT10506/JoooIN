package com.joooin.system.event._35.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.joooin.model.EventMainBean;
import com.joooin.repository.EventMainDao;

@Controller
public class EventsController {
	
	@Autowired
	EventMainDao dao;
	
	@RequestMapping(value = "/events", method = RequestMethod.GET)
	public String eventspage(Model model) {
		EventMainBean event = new EventMainBean();
		event.setEventAddress("三民路");
		model.addAttribute("NewEvent", event);
		return "event/events";
	}
	
	@RequestMapping(value = "/events", method = RequestMethod.POST)
	public String processAddNewEvent(@ModelAttribute("NewEvent") EventMainBean event, 
		     HttpServletRequest request ) {
        dao.save(event);

		//service.addProduct(bb);
		//  將上傳的檔案移到指定的資料夾

		return "redirect:/events";
	}
}
