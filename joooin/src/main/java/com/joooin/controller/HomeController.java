package com.joooin.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.joooin.model.EventMainBean;
import com.joooin.model.MemberMainBean;
import com.joooin.system.event._35.service.EventsService;
import com.joooin.system.member._27.service.MemberService;
import com.joooin.util.ImageUtils;

@Controller
public class HomeController {
	@Autowired
	MemberService memberService;
	@Autowired
	EventsService eventService;
	@Autowired
	ServletContext context;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homepage() {
		return "index";
	}
	@RequestMapping(value = "/navbar", method = RequestMethod.GET)
	public String navbar() {
		return "navbar";
	}
	@RequestMapping(value = "/getMemberImage/{memberId}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getMemberImage(@PathVariable Integer memberId) {
		MemberMainBean bean = memberService.getMemberMainBean(memberId);
		
		if (bean != null) {
			return ImageUtils.byteArrayToImage(bean.getMemberImage());
		} else {
			Byte[] b = ImageUtils.localImageToByteArray("no_image.png", context);
			return ImageUtils.byteArrayToImage(b);
		}
	}
	
	@RequestMapping(value = "/getEventImage/{eventId}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getEventImage(@PathVariable Integer eventId) {
		EventMainBean bean = eventService.getByEventMainId(eventId);
		
		if (bean != null) {
			return ImageUtils.byteArrayToImage(bean.getEventImage());
		} else {
			Byte[] b = ImageUtils.localImageToByteArray("no_image.png", context);
			return ImageUtils.byteArrayToImage(b);
		}
	}
	
	@RequestMapping(value = "/notLogin", method = RequestMethod.GET)
	public String notLogin() {
		return "not_login";
	}
}
