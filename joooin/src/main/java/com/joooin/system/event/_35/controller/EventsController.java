package com.joooin.system.event._35.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joooin.model.EventLikeBean;
import com.joooin.model.EventMainBean;
import com.joooin.model.EventMemberBean;
import com.joooin.model.EventTypeBean;
import com.joooin.repository.EventLikeDao;
import com.joooin.repository.impl.EventLikeDaoImpl;
import com.joooin.system.event._35.service.EventsService;
import com.joooin.system.event._35.service.EventMemberService;
import com.joooin.system.event._35.service.EventTypeService;
import com.joooin.util.ImageUtils;



@Controller
public class EventsController {
	
	@Autowired
	ServletContext context;
	
	@Autowired
	EventsService eventservice;
	
	@Autowired
	EventMemberService eventmemberservice;
	
	@Autowired
	EventTypeService eventtypeservice;
	
	@Autowired
	EventLikeDao eventLikeDao;
	
	@RequestMapping(value = "/events", method = RequestMethod.GET)
	public String eventspage(Model model) {
		EventMainBean event = new EventMainBean();
		
		List<EventMainBean> allevents = eventservice.getAll();		
		
		model.addAttribute("AllEvents", allevents);
		
		model.addAttribute("NewEvent", event);
		return "event/events";
	}
	
	@RequestMapping(value = "/events", method = RequestMethod.POST)
	public String processAddNewEvent(@ModelAttribute("NewEvent") EventMainBean event, 
			@RequestParam("quantity") String quantity,HttpServletRequest request
			) { 
		HttpSession session = request.getSession();
		Integer inviterId = (Integer) (session.getAttribute("memberId"));  //開團者ID
		Integer realquan;

		if(inviterId!=null ) {
		
		if(quantity==null || quantity.trim().equals("") || quantity.trim()==null) {

			realquan=0;
		}else {realquan = new Integer(quantity);}
		
		if(event.getEventFee()==null) {event.setEventFee(0);}
		
		//event.setEventImage(new Byte[] {2,3});
		Byte[] eventImage = null;
		if (!event.getMultipartFile().isEmpty()) {
			eventImage = ImageUtils.multipartFileToByteArray(event.getMultipartFile());
			event.setEventImage(eventImage);
		} else {
			if(event.getEventTypeId()==1) 
			{event.setEventImage(ImageUtils.localImageToByteArray("cover_food.jpg", context));}
			else if(event.getEventTypeId()==2)
			{event.setEventImage(ImageUtils.localImageToByteArray("cover_sport.jpg", context));} 
			else if(event.getEventTypeId()==3)
			{event.setEventImage(ImageUtils.localImageToByteArray("cover_entertainment.jpg", context));}
			else if(event.getEventTypeId()==4)
			{event.setEventImage(ImageUtils.localImageToByteArray("cover_other.jpg", context));}		
		}


		
		//event.getEventDateStart();
		//event.getEventDateEnd();
		
	    SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy/MM/dd HH:mm");
	    SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy/MM/dd HH:mm");

	    Date dates = null;
	    Date datee = null;
		try {
			dates = sdf1.parse(event.getEventDateStart());
			datee = sdf1.parse(event.getEventDateEnd());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        Date now = new Date();

	    String eventstart = sdf2.format(dates); 
	    String eventend = sdf2.format(datee); 
	    String eventcreate = sdf2.format(now);

	    //System.out.println( eventstart);
	    //System.out.println( eventend);

	 
	    event.setEventCreateDate(eventcreate);

	    event.setEventDateStart(eventstart);
	    event.setEventDateEnd(eventend);
		event.setEventInviterId(inviterId);		
		event.setEventCurrentMembers(1+realquan);
		event.setEventLike(0);
		event.setEventStatus("unchecked");
		
		event.setIsFull(false);

		

		Integer eventId = eventservice.save(event);
		EventMemberBean eventmember = new EventMemberBean();
		eventmember.setEventId(eventId);
		eventmember.setIsAgreed(true);
		eventmember.setIsAttended(true);
		eventmember.setIsPaid(true);
		eventmember.setMemberId(inviterId);
		eventmember.setQuantity(realquan+1);
		eventmemberservice.save(eventmember);
		
		return "redirect:/events";
	}
		else {
			return "not_login";
		}	
		
	}

	
	@RequestMapping(value = "/event/newEventProcess", method = RequestMethod.POST)
	public @ResponseBody String newEventProcess(HttpSession session) {
		
		if(session.getAttribute("memberId")!=null) {
	    return "login";
	    }else {  return "notLogin";}
		
	}
	
	@RequestMapping(value = "/notLogin")  //新增活動 按讚時AJAX確認登入用  可能需要刪除
	public String notLogin() {		
		return "not_login";
	}
	
	@RequestMapping(value = "/event/good/{eventId}", method = RequestMethod.POST)
	public @ResponseBody Integer giveEventLike(Integer eventId,HttpSession session) {
		
		if(session.getAttribute("memberId")!=null) {
			Integer memberId = (Integer) session.getAttribute("memberId");			
			return eventservice.processeventlike(eventId, memberId);

	    }else {  return -5;}
	
	}
	
	@RequestMapping(value = "/event/good/dis/{eventId}", method = RequestMethod.POST)
	public @ResponseBody String displayEventLike(Integer eventId,HttpSession session) {

			Integer memberId = (Integer) session.getAttribute("memberId");			
			return eventservice.displayeventlike(eventId, memberId);
	}	
	
	@ModelAttribute("EventTypeList") // 當有控制器方法被執行時,在控制器方法之前先執行,才執行該方法
	public Map<String, String> getCompanyList() {
		Map<String, String> EventTypeMap = new HashMap<>();
		 List<EventTypeBean> list = eventtypeservice.getAll();
		for (EventTypeBean cb : list) {
			EventTypeMap.put(cb.getEventType(), cb.getEventType());
		}
		return EventTypeMap;
	}
	
}
