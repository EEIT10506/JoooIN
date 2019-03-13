package com.joooin.system.event._02.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
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
	@Autowired
	ServletContext context; 
	//主頁面進入前
	@RequestMapping("/event")
	public String test(Model model, HttpSession session) {
		
		
		return "event/event";
	}
	@RequestMapping(value = "/event/eventPost", method = RequestMethod.POST)
	public String submitEventPost(HttpSession session, @RequestParam Integer eventId, @RequestParam Integer memberId, @RequestParam String eventPostContent) {
		
		if (memberId != null) {
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
		}else {
			return "not_login";
		}
		
	}
	@RequestMapping(value = "/DeleteEventPost", method = RequestMethod.POST)
	public String deleteEventPost(HttpSession session, @RequestParam Integer eventPostId, 
												@RequestParam Integer eventId) {
		Integer adminId = (Integer)session.getAttribute("admin");
		if (adminId != null) {
//		eventservice.deleteEventPost(eventPostId);
		EventPostBean eventPostBean = eventservice.getByEventPostId(eventPostId);
				eventPostBean.setIsDeleted(true);
				eventservice.updateEventPostIsDeleted(eventPostBean);
		return "redirect:/event/"+eventId;
		}else {
			return "not_login";
		}
		
	}
	
	@RequestMapping(value = "/event/eventCheckQuantity", method = RequestMethod.POST)
	public String checkQuantity(Model model, @RequestParam Integer memberId, 
											 @RequestParam Integer eventId,
											 @RequestParam String quantity) {
		if (memberId != null) {
		
		EventMemberBean eventMemberBean = new EventMemberBean();
		
		Integer quantitys = Integer.parseInt(quantity);
		eventMemberBean.setEventId(eventId);
		eventMemberBean.setMemberId(memberId);
		eventMemberBean.setQuantity(quantitys);
		eventMemberBean.setIsPaid(null);
		eventMemberBean.setIsAgreed(false);
		eventMemberBean.setIsAttended(true);
		Integer i = eventservice.saveEventMember(eventMemberBean);
		
		return "redirect:/event/"+eventId;
		}else {
			return "not_login";
		}
	}
	@RequestMapping(value = "/DeleteByEventMemberId", method = RequestMethod.POST)
	public String deleteByEventMemberId(Model model, @RequestParam Integer memberId, @RequestParam Integer eventId ) {
		if (memberId != null) {
			List<EventMemberBean> evmems = eventservice.getByEventMainId(eventId).getEventMemberList();

			for(EventMemberBean evmem:evmems) {
			if (evmem.getMemberId().equals(memberId)){  
				eventservice.deleteEventMemberById(evmem.getEventMemberId()); break;
				}
			}

			return "redirect:/event/"+eventId;
		}else {
			return "not_login";
		}
	}
	//詳細活動資訊 & 成員 click button 才帶資料顯示
	
	@SuppressWarnings("unlikely-arg-type")
	@RequestMapping("/event/{eventId}")
	public String eventDetail(Model model,HttpSession session, @PathVariable("eventId") Integer eventId) {
		Integer memberId = (Integer) session.getAttribute("memberId");
		
		EventMainBean event = eventservice.getByEventMainId(eventId);
		Integer typeid = event.getEventTypeId();
		Integer inviterid = event.getEventInviterId();
		
		List<EventMemberBean> emlist = event.getEventMemberList();
		List<Integer> emidlist = new LinkedList<Integer>();
		for(EventMemberBean em:emlist) {
			emidlist.add(em.getMemberId());
		}
		boolean memberCheck = emidlist.contains(memberId);
		
		
		
		
		
		EventTypeBean eventtype = eventservice.getByEventTypeId(typeid);
		MemberMainBean eventbuildname = eventservice.getByMemberId(inviterid);
		
		List<EventMemberBean> eventmember = event.getEventMemberList();
		//int totalmember = eventmember.size();
		MemberMainBean eventmembers = null;
		List<MemberMainBean> eventmemberlist = new ArrayList<MemberMainBean>();
		List<MemberMainBean> emfindagreed = new ArrayList<MemberMainBean>();
		
		for(EventMemberBean members: eventmember) {
			Integer memberid = members.getMemberId();
			eventmembers  = eventservice.getByMemberId(memberid);
			eventmemberlist.add(eventmembers);
			Boolean isAgreed = members.getIsAgreed();
			if(isAgreed == true) {
				emfindagreed.add(eventmembers);
			}
		}
		
		List<EventPostBean> eventPost = event.getEventPostList();
		
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
		model.addAttribute("inviterid", inviterid);
		model.addAttribute("eventmember", eventmember);
		model.addAttribute("eventmembers", eventmemberlist);
		model.addAttribute("eventPost", eventPost);
		model.addAttribute("eventPostMemberList", eventPostMemberList);
		model.addAttribute("memberCheck", memberCheck);
		model.addAttribute("emfindagreed", emfindagreed);
		
		return "event/event";
	}
	//活動修改
	@RequestMapping("/event/setting")
	public String eventSetting(Model model, @RequestParam("eventAdminId") Integer eventId) {
		EventMainBean event = eventservice.getByEventMainId(eventId);

//		Integer typeid = event.getEventTypeId();
//		EventTypeBean eventtype = eventservice.getByEventTypeId(typeid);
//		String eventType = eventtype.getEventType();
		model.addAttribute("events", event);
//		model.addAttribute("eventtype", eventtype);
		return "event/event_setting";
	}
	
}
