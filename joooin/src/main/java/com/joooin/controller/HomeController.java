package com.joooin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@RequestMapping(method = RequestMethod.GET, value = "/")
	public String homepage() {
		return "index";
	}
	@RequestMapping(method = RequestMethod.GET, value = "/navbar")
	public String navbar() {
		return "navbar";
	}
}
