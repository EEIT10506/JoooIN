package com.joooin.system.event._35.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.joooin.model.EventMainBean;
import com.joooin.model.EventMemberBean;
import com.joooin.model.EventTypeBean;
import com.joooin.model.MemberMainBean;
import com.joooin.repository.EventMemberDao;
import com.joooin.repository.MemberMainDao;
import com.joooin.system.event._35.service.EventMainService;
import com.joooin.system.event._35.service.EventMemberService;
import com.joooin.system.event._35.service.EventTypeService;



@Controller
public class EventsController {
	
	@Autowired
	EventMainService eventservice;
	
	@Autowired
	EventMemberService eventmemberservice;
	
	@Autowired
	EventTypeService eventtypeservice;
	
	
	@RequestMapping(value = "/events", method = RequestMethod.GET)
	public String eventspage(Model model) {
		EventMainBean event = new EventMainBean();
		
		List<EventMainBean> allevents = eventservice.getAll();
		
//		List<String> eventstarts;
//		List<String> eventends;
//		for(int i = 0;i<allevents.size();i++) {
//		allevents.get(i).getEventDateStart();
//		}
		
		model.addAttribute("AllEvents", allevents);
		
		model.addAttribute("NewEvent", event);
		return "event/events";
	}
	
	@RequestMapping(value = "/events", method = RequestMethod.POST)
	public String processAddNewEvent(@ModelAttribute("NewEvent") EventMainBean event, 
			@RequestParam("quantity") String quantity,HttpServletRequest request
			) {
		HttpSession session = request.getSession();
		
		Integer realquan;
		if(quantity==null || quantity.trim()=="") {realquan=0;}
		else{realquan = new Integer(quantity);}
		
		if(event.getEventFee()==null) {event.setEventFee(0);}
		
		event.setEventImage(null);
		
		Integer inviterId = (Integer) session.getAttribute("memberId"); //開團者ID
		
		//event.getEventDateStart();
		//event.getEventDateEnd();
		
	    SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
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


	    String eventstart = sdf2.format(dates); 
	    String eventend = sdf2.format(datee); 
	    
	    Date date = new Date();
		
		String eventCreateDate =sdf2.format(date);
		
	    //System.out.println( eventstart);
	    //System.out.println( eventend);
	    event.setEventCreateDate(eventCreateDate);
	    event.setEventDateStart(eventstart);
	    event.setEventDateEnd(eventend);
		event.setEventInviterId(inviterId);		
		event.setEventCurrentMembers(1+realquan);
		event.setEventLike(0);
		event.setEventStatus("unchecked");
		
		event.setIsFull(false);
		
//	MemberMainBean member = new MemberMainBean();
//	
//	member.setBirthday("1988-8-8");
//	member.setBirthdayDisplay(false);
//	member.setCertificationHash("ssaa");
//	member.setCertificationStatus(true);
//	member.setCity("台南");
//	member.setCityDisplay(false);
//	member.setEmail("wan@gmail");
//	member.setEmailDisplay(false);
//	member.setGender("male");
//	member.setGenderDisplay(false);
//	member.setLogins(0);
//	member.setMemberCreateDate("2019-3-8");
//	member.setMemberImage(new Byte[] {2});
//	member.setMemberName("旺小蒙");
//	member.setPassword("passw0rd");
//	member.setPhone("0933333333");
//	member.setPhoneDisplay(false);
//
//		memdao.save(member);
		

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
