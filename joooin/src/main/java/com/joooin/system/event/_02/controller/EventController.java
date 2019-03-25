package com.joooin.system.event._02.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import javax.mail.Session;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.joooin.model.EventLikeBean;
import com.joooin.model.EventMainBean;
import com.joooin.model.EventMemberBean;
import com.joooin.model.EventPostBean;
import com.joooin.model.EventTypeBean;
import com.joooin.model.MemberMainBean;
import com.joooin.model.ReportBean;
import com.joooin.repository.EventLikeDao;
import com.joooin.system.admin._03.service.ReportService;
import com.joooin.system.event._02.service.EventService;
import com.joooin.system.event._02.service.impl.GetPostContentBean;
import com.joooin.system.event._35.service.EventMemberService;
import com.joooin.system.event._35.service.EventsService;
import com.joooin.system.member._27.service.MemberService;

@Controller
public class EventController {
	@Autowired
	EventService eventService;
	@Autowired
	ServletContext context;
	@Autowired
	EventLikeDao eventLikeDao;
	@Autowired
	EventsService eventMainService;
	@Autowired
	ReportService reportService;
	@Autowired
	EventMemberService eventMemberService;
	//新增留言
	@RequestMapping(value = "/event/eventPost", method = RequestMethod.POST)
	public String submitEventPost(@RequestParam Integer eventId, @RequestParam String eventPostContent,
			HttpSession session) {
		Integer memberId = (Integer) session.getAttribute("memberId");
		if (memberId != null) {
			EventPostBean eventPostBean = new EventPostBean();
			eventPostBean.setEventId(eventId);
			eventPostBean.setMemberId(memberId);
			eventPostContent = eventPostContent.replace("\n", "<br />");
			eventPostBean.setEventPostContent(eventPostContent);

			Date date = new Date();
			SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String eventPostDate = time.format(date);

			eventPostBean.setEventPostDate(eventPostDate);
			eventPostBean.setIsDeleted(false);

			Integer eventPostId = eventService.saveOneEventPost(eventPostBean);
			return "redirect:/event/" + eventId;
		} else {
			return "not_login";
		}

	}
//刪除留言 (update isDeleted)
	@RequestMapping(value = "/DeleteEventPost", method = RequestMethod.POST)
	public String deleteEventPost(@RequestParam Integer eventPostId, @RequestParam Integer eventId,
			HttpSession session) {
		Integer adminId = (Integer) session.getAttribute("adminId");
		Integer memberId = (Integer) session.getAttribute("memberId");

		if (adminId != null || memberId != null) {
			EventPostBean eventPostBean = eventService.getByEventPostId(eventPostId);
			eventPostBean.setIsDeleted(true);
			eventService.updateEventPostIsDeleted(eventPostBean);
			return "redirect:/event/" + eventId;
		} else {
			return "not_login";
		}
	}
//確認報名數量 要通知 OK
	@RequestMapping(value = "/event/eventCheckQuantity", method = RequestMethod.POST)
	public String checkQuantity(@RequestParam Integer eventId, @RequestParam String quantity, Model model,
			HttpSession session, RedirectAttributes attributes) {
		Integer memberId = (Integer) session.getAttribute("memberId");
		
		Integer inviterId = eventMainService.getByEventMainId(eventId).getEventInviterId();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date now = new Date();
		String eventupdate = sdf.format(now);
		String notificationContent = "event_request_eventId=" + eventId;
		if (memberId != null) {
			EventMemberBean eventMemberBean = new EventMemberBean();

			Integer quantitys = Integer.parseInt(quantity);
			eventMemberBean.setEventId(eventId);
			eventMemberBean.setMemberId(memberId);
			eventMemberBean.setQuantity(quantitys);
			eventMemberBean.setIsPaid(null);
			eventMemberBean.setIsAgreed(false);
			eventMemberBean.setIsAttended(null);
			
			Integer i = eventService.saveEventMember(eventMemberBean);


			String check = "OK";
			attributes.addFlashAttribute("signUpSuccess", check);
			eventMainService.addnotification(inviterId, notificationContent, eventupdate, false);

			return "redirect:/event/" + eventId;
		} else {
			return "not_login";
		}
	}
//	退出活動
	@RequestMapping(value = "/DeleteByEventMemberId", method = RequestMethod.POST)
	public String deleteByEventMemberId(@RequestParam Integer eventId, HttpSession session) {
		Integer memberId = (Integer) session.getAttribute("memberId");
		if (memberId != null) {
			eventService.deleteEventMemberById(eventId, memberId);
			return "redirect:/event/" + eventId;
		} else {
			return "not_login";
		}
	}

	@RequestMapping("/event/{eventId}")
	public String eventDetail(@PathVariable("eventId") Integer eventId, Model model, HttpSession session) {
		Integer memberId = (Integer) session.getAttribute("memberId");

		EventMainBean event = eventService.getByEventMainId(eventId);
		Integer typeid = event.getEventTypeId();
		Integer inviterid = event.getEventInviterId();
		String endDate = event.getEventDateEnd();

		SimpleDateFormat format = new SimpleDateFormat();
		format.applyPattern("yyyy/MM/dd HH:mm");
		Date endTime = null;
		try {
			endTime = format.parse(endDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		// Date endTime = DateFormat.getDateTimeInstance().parse(endDate);
		Date timeNow = new Date();
		boolean finish = endTime.after(timeNow);

		List<EventMemberBean> emlist = event.getEventMemberList();
		List<Integer> emidlist = new LinkedList<Integer>();
		for (EventMemberBean em : emlist) {
			emidlist.add(em.getMemberId());
		}
		boolean memberCheck = emidlist.contains(memberId);

		EventTypeBean eventtype = eventService.getByEventTypeId(typeid);
		MemberMainBean eventbuildname = eventService.getByMemberId(inviterid);

//		參加人員isAgree = true
		List<EventMemberBean> eventmember = event.getEventMemberList();
		List<EventMemberBean> eventMemberList = new ArrayList<EventMemberBean>();
		List<MemberMainBean> findAgreed = new ArrayList<MemberMainBean>();
		MemberMainBean eventmembers = null;
		List<MemberMainBean> eventmemberlist = new ArrayList<MemberMainBean>();
		List<MemberMainBean> emfindagreed = new ArrayList<MemberMainBean>();
		Boolean myAgreed = null;
		for (EventMemberBean members : eventmember) {
			Integer memberid = members.getMemberId();
			Integer eventIds = members.getEventId();
			Integer eventMemberId = members.getEventMemberId();
			eventmembers = eventService.getByMemberId(memberid);
			eventmemberlist.add(eventmembers);
				
			
			Boolean isAgreed = members.getIsAgreed();

			if (isAgreed == true ) {
				emfindagreed.add(eventmembers);
				if(memberid.equals(memberId)) {
					myAgreed = true;
				}
			}
		}
		if(myAgreed==null) {
			myAgreed=false;
			}
		// 抓留言資訊
		List<EventPostBean> eventPost = event.getEventPostList();
		List<GetPostContentBean> getPostContentlist = new ArrayList<>();

		for (EventPostBean postMember : eventPost) {
			Integer postMemberId = postMember.getMemberId();
			String postContent = postMember.getEventPostContent();
			String postDate = postMember.getEventPostDate();
			Boolean isDeleted = postMember.getIsDeleted();
			Integer postId = postMember.getEventPostId();
			MemberMainBean eventPostMember = eventService.getByMemberId(postMemberId);

			String memberName = eventPostMember.getMemberName();
			Byte[] memberImage = eventPostMember.getMemberImage();

			GetPostContentBean bean = new GetPostContentBean();
			bean.setEventPostContent(postContent);
			bean.setMemberName(memberName);
			bean.setMemberImage(memberImage);
			bean.setEventPostDate(postDate);
			bean.setIsDeleted(isDeleted);
			bean.setEventPostId(postId);
			bean.setMemberId(postMemberId);
			getPostContentlist.add(bean);
		}
		// LIKE

		String notLike = null;
		List<EventLikeBean> likeList = event.getEventLikeList();
		for (EventLikeBean like : likeList) {
			if (like.getEventId().equals(eventId) && like.getMemberId().equals(memberId)) {
				model.addAttribute("likedCheck", like);
			} else {
				model.addAttribute("notLike", notLike);
			}
		}
		model.addAttribute("myAgreed", myAgreed);
		model.addAttribute("findAgreed", findAgreed);
		model.addAttribute("finish", finish);
		model.addAttribute("event", event);
		model.addAttribute("eventtype", eventtype);
		model.addAttribute("eventbuildname", eventbuildname);
		model.addAttribute("inviterid", inviterid);
		model.addAttribute("eventmember", eventmember);
		model.addAttribute("eventmembers", eventmemberlist);
		model.addAttribute("eventPost", eventPost);
		model.addAttribute("memberCheck", memberCheck);
		model.addAttribute("emfindagreed", emfindagreed);
		model.addAttribute("getPostContentlist", getPostContentlist);
		return "event/event";
	}

	@RequestMapping(value = "/event/goods/{eventId}", method = RequestMethod.POST)
	public @ResponseBody Integer giveEventLike(Integer eventId, HttpSession session) {
		Integer memberId = (Integer) session.getAttribute("memberId");
		Integer realLike = -4;
		
		if (memberId != null) {
			List<EventLikeBean> list = eventLikeDao.getAll();
			int count = 0;
			for (EventLikeBean eventLikeBean : list) {
				if (eventLikeBean.getEventId().equals(eventId) && eventLikeBean.getMemberId().equals(memberId)) {
					eventLikeDao.deleteByEventLikeId(eventLikeBean.getEventLikeId());

					EventMainBean updateEvent = eventMainService.getByEventMainId(eventId);
					Integer like = updateEvent.getEventLike();
					int updatelike = (like.intValue() - 1);
					realLike = Integer.valueOf(updatelike);

					updateEvent.setEventLike(realLike);
					eventMainService.update(updateEvent);

					count++;
					return realLike;
				}
			}
			if (count == 0) {
				EventLikeBean eventLikeBean = new EventLikeBean();
				eventLikeBean.setEventId(eventId);
				eventLikeBean.setMemberId(memberId);
				eventLikeDao.save(eventLikeBean);
				Integer like = eventMainService.getByEventMainId(eventId).getEventLike();

				int updatelikes = like.intValue() + 1;
				 realLike = Integer.valueOf(updatelikes);

				EventMainBean updateEvent = eventMainService.getByEventMainId(eventId);
				updateEvent.setEventLike(realLike);
				eventMainService.update(updateEvent);
				
			}
			return realLike; 
		} else {
			return realLike;
		}
	}

	@RequestMapping(value = "/event/checkLike/{eventId}", method = RequestMethod.POST)
	public @ResponseBody String eventLikeCheck(Integer eventId, HttpSession session) {
		Integer memberId = (Integer) session.getAttribute("memberId");
		List<EventLikeBean> list = eventLikeDao.getAll();
		for (EventLikeBean bean : list) {
			if (bean.getMemberId().equals(memberId) && bean.getEventId().equals(eventId)) {
				return "liked";
			} 
		}
		return "notLike";
	}

	// 活動修改
	@RequestMapping(value = "/event/settingbar", method = RequestMethod.GET)
	public String eventSettingBar() {
		return "event/settingbar";
	}

	@RequestMapping(value = "/event/setting/{eventId}", method = RequestMethod.GET)
	public String eventSetting(@ModelAttribute("event") EventMainBean updateBean,
			@PathVariable("eventId") Integer eventId, Model model, HttpSession session) {
		Integer memberId = (Integer) session.getAttribute("memberId");
		EventMainBean event = eventService.getByEventMainId(eventId);

		if (memberId != null && memberId.equals(event.getEventInviterId())) {

			
			Integer typeid = event.getEventTypeId();
			EventTypeBean eventtype = eventService.getByEventTypeId(typeid);
			
//			=============
			Date timeNow = new Date();
			String endDate = event.getEventDateEnd();
			SimpleDateFormat format = new SimpleDateFormat();
			format.applyPattern("yyyy/MM/dd HH:mm");
			Date endTime = null;
			try {
				endTime = format.parse(endDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			boolean eventFinished = endTime.after(timeNow);
			if(!model.containsAttribute("check")){
			model.addAttribute("check", "undo");
			}
			model.addAttribute("eventFinished", eventFinished);
//			=============
			model.addAttribute("event", event);
			model.addAttribute("eventtype", eventtype);

			return "event/event_setting";

		} else if(memberId != null && !memberId.equals(event.getEventInviterId())) {

		    return "event/not_eventManager";	
		}
		
		else {
			return "not_login";
		}
	}

	// 修改活動資料 //僅通知已被同意的活動成員 OK
	@RequestMapping(value = "/event/setting/{eventId}", method = RequestMethod.POST)
	public String eventSettingUpdate(@ModelAttribute("event") EventMainBean updateBean,
			@PathVariable("eventId") Integer eventId, Model model, HttpSession session, RedirectAttributes attributes) {
		Integer memberId = (Integer) session.getAttribute("memberId");
		EventMainBean event = eventService.getByEventMainId(eventId);
		Integer inviterId = event.getEventInviterId();
		Integer check =0;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date now = new Date();
		String eventupdate = sdf.format(now);
		String notificationContent = "event_modified_eventId=" + eventId;
		if (memberId != null && memberId.equals(inviterId)) {

			Boolean checkLimit = eventService.updateEvent(eventId, updateBean, context);
			
			model.addAttribute("event", event);
			if (checkLimit == true) {
				check = 1;
				attributes.addFlashAttribute("check", check);
				List<EventMemberBean> myMemberList = eventMemberService.getAll();
				Iterator<EventMemberBean> iterator = myMemberList.iterator();
			     while(iterator.hasNext()) {  			    	
			    	 EventMemberBean eventMember = iterator.next();					
				         if(eventMember.getMemberId().equals(memberId) || !(eventMember.getEventId().equals(eventId))) {  
				             iterator.remove();  
				         }   	
			     }
			     for(EventMemberBean myMember : myMemberList) {
			    	 if(myMember.getIsAgreed()) {
			    	 Integer myMember_memberId = myMember.getMemberId();

				   eventMainService.addnotification(myMember_memberId, notificationContent, eventupdate, false);

			    	 }
			     }
				return "redirect:/event/setting/" + eventId;
			}else {
				return "redirect:/notEnough/" + eventId;
			}
		} else {
			System.out.println(check);
			return "not_login";
		}
	}

//	人數限制少於目前人數
	@RequestMapping(value = "/notEnough/{eventId}")
	public String notEnoughCurrentMember(@PathVariable Integer eventId, Model model) {
			model.addAttribute("eventId", eventId);
		return "event/not_Enough";
	}
//	前端判斷BLUR
	@RequestMapping(value = "/event/currentMember/{eventId}", method = RequestMethod.POST)
	public @ResponseBody String currentMemberCheck(Integer eventId, Integer memberLimit, HttpSession session) {
		EventMainBean event = eventService.getByEventMainId(eventId);
		Integer currentMember = event.getEventCurrentMembers();
		int current = currentMember.intValue();
		int limit = memberLimit.intValue();
		if (current < limit) {
			event.setIsFull(false);
			eventService.updateQuantityWhenOut(event);
			return "yes";
		}else if(current == limit){
			event.setIsFull(true);
			eventService.updateQuantityWhenOut(event);
			return "yes";
		}else {
			return "no";
		}

	}

//	已報名人員名單  
	@RequestMapping(value = "/event/signUp/{eventId}")
	public String eventSignUp(@PathVariable("eventId") Integer eventId, Model model, HttpSession session) {
		Integer memberId = (Integer) session.getAttribute("memberId");
		EventMainBean event = eventService.getByEventMainId(eventId);
		Integer inviterId = event.getEventInviterId();
		if (memberId != null && memberId.equals(inviterId)) {
			List<EventMemberBean> eventMemberList = event.getEventMemberList();
			List<MemberMainBean> memberList = new ArrayList<MemberMainBean>();
			List<EventMemberBean> eventMemberId = new ArrayList<EventMemberBean>();
			MemberMainBean eventMembers = null;
			for (EventMemberBean bean : eventMemberList) {
				if (bean.getIsAgreed() == false) {
					Integer memberid = bean.getMemberId();
					Integer id = bean.getEventMemberId();
					EventMemberBean eventMemberIds = eventService.getByEventMemberId(id);
					eventMembers = eventService.getByMemberId(memberid);
					memberList.add(eventMembers);
					eventMemberId.add(eventMemberIds);
				}
			}
//			==============
			Date timeNow = new Date();
			String endDate = event.getEventDateEnd();
			SimpleDateFormat format = new SimpleDateFormat();
			format.applyPattern("yyyy/MM/dd HH:mm");
			Date endTime = null;
			try {
				endTime = format.parse(endDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			boolean eventFinished = endTime.after(timeNow);
			
			model.addAttribute("eventFinished", eventFinished);
//			===============
			model.addAttribute("eventMemberId", eventMemberId);
			model.addAttribute("memberList", memberList);
			model.addAttribute("event", event);
			return "event/event_signUp";
		} else {
			return "not_login";
		}
	}
//報名同意   通知OK
	@RequestMapping(value = "/event/eventAgreed/{eventId}")
	public @ResponseBody String agreedMember(Integer eventId, Integer eventMemberId, HttpSession session) {
		Integer memberId = (Integer) session.getAttribute("memberId");
		EventMainBean event = eventService.getByEventMainId(eventId);
		Integer inviterId = event.getEventInviterId();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date now = new Date();
		String eventupdate = sdf.format(now);
		String notificationContent = "event_joined_eventId=" + eventId;
		if (memberId != null && memberId.equals(inviterId)) {
			EventMemberBean bean = eventService.getByEventMemberId(eventMemberId);
			Integer current = event.getEventCurrentMembers();
			Integer quantity = bean.getQuantity();
			Integer limit = event.getEventMemberLimit();
			Integer agreedMember = limit - current;
			if(quantity <= agreedMember) {
			int newCurrent = current + quantity;
			Integer eventNewCurrentMember = Integer.valueOf(newCurrent);
			event.setEventCurrentMembers(eventNewCurrentMember);
			eventService.updateQuantityWhenOut(event);
			bean.setIsAgreed(true);
			eventService.updateIsAgreed(bean);

			eventMainService.addnotification(bean.getMemberId(), notificationContent, eventupdate, false);

			if(eventNewCurrentMember.equals(limit)) {
				event.setIsFull(true);
				eventService.updateQuantityWhenOut(event);
			}
			return "attended";
			}else {
				return "attendFail";
			}
		} else {
			return "not_login";
		}
	}
	//人數達到滿團 改isFull
	
	//人數超過限制
	@RequestMapping(value = "/attendFail/{eventId}")
	public String attendFail(@PathVariable Integer eventId, Model model) {
			model.addAttribute("eventId", eventId);
		return "event/attendFail";
	}
//	報名拒絕
	@RequestMapping(value = "/event/eventReject/{eventId}")
	public @ResponseBody String rejectMember(Integer eventId, Integer eventMemberId, HttpSession session) {
		Integer memberId = (Integer) session.getAttribute("memberId");
		EventMainBean event = eventService.getByEventMainId(eventId);
		Integer inviterId = event.getEventInviterId();
		if (memberId != null && memberId.equals(inviterId)) {
			eventService.rejectSignUp(eventMemberId);
			return "rejected";
		} else {
			return "not_login";
		}
	}
//	已參加人員名單
	@RequestMapping(value = "/event/participated/{eventId}")
	public String eventParticipated(@PathVariable("eventId") Integer eventId, Model model, HttpSession session) {
		Integer memberId = (Integer) session.getAttribute("memberId");
		EventMainBean event = eventService.getByEventMainId(eventId);
		Integer inviterId = event.getEventInviterId();
		if (memberId != null && memberId.equals(inviterId)) {
			List<EventMemberBean> eventMemberList = event.getEventMemberList();
			List<MemberMainBean> attendList = new ArrayList<MemberMainBean>();
			List<EventMemberBean> eventMemberId = new ArrayList<EventMemberBean>();
			MemberMainBean eventMembers = null;
			EventMemberBean eventMemberMyself = null;
			for (EventMemberBean bean : eventMemberList) {
				if (bean.getIsAgreed() && !bean.getMemberId().equals(inviterId)) {
					Integer memberid = bean.getMemberId();
					Integer id = bean.getEventMemberId();
					EventMemberBean eventMemberIds = eventService.getByEventMemberId(id);
					eventMembers = eventService.getByMemberId(memberid);
					attendList.add(eventMembers);
					eventMemberId.add(eventMemberIds);
				}
				if(bean.getIsAgreed() && bean.getMemberId().equals(inviterId)){
					Integer idMyself = bean.getEventMemberId();
					 eventMemberMyself = eventService.getByEventMemberId(idMyself);
				}
			}
//			=======
			Date timeNow = new Date();
			String endDate = event.getEventDateEnd();
			SimpleDateFormat format = new SimpleDateFormat();
			format.applyPattern("yyyy/MM/dd HH:mm");
			Date endTime = null;
			try {
				endTime = format.parse(endDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			boolean eventFinished = endTime.after(timeNow);
			
			model.addAttribute("eventFinished", eventFinished);
			//			=======


			
			
			model.addAttribute("attendList", attendList);
			model.addAttribute("event", event);
			model.addAttribute("eventMemberId", eventMemberId);
			model.addAttribute("eventMemberMyself", eventMemberMyself);
			return "event/event_participated";
		} else {
			return "not_login";
		}
	}
	//踢人 要通知OK
	@RequestMapping(value = "/event/eventGetOut/{eventId}")
	public @ResponseBody String getOutMember(Integer eventId, Integer eventMemberId, HttpSession session) {
		Integer memberId = (Integer) session.getAttribute("memberId");
		EventMainBean event = eventService.getByEventMainId(eventId);
		EventMemberBean bean = eventService.getByEventMemberId(eventMemberId);
		Integer inviterId = event.getEventInviterId();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date now = new Date();
		String eventupdate = sdf.format(now);
		String notificationContent = "event_reject_eventId=" + eventId;
		if (memberId != null && memberId.equals(inviterId)) {
			eventService.rejectSignUp(eventMemberId);
			Integer quantity = bean.getQuantity();
			Integer current = event.getEventCurrentMembers();
			Integer currentNow = current - quantity;
			event.setEventCurrentMembers(currentNow);

			eventMainService.addnotification(bean.getMemberId(), notificationContent, eventupdate, false);

			eventService.updateQuantityWhenOut(event);
			if(event.getEventMemberLimit() > currentNow) {
				event.setIsFull(false);
				eventService.updateQuantityWhenOut(event);
			}
			return "outed";
		} else {
			return "not_login";
		}
	}
	
	@RequestMapping(value = "/event/attended/{eventId}")
	public String eventAttented(@PathVariable("eventId") Integer eventId, Model model, HttpSession session) {
		Integer memberId = (Integer) session.getAttribute("memberId");
		EventMainBean event = eventService.getByEventMainId(eventId);
		Integer inviterId = event.getEventInviterId();
		if (memberId != null && memberId.equals(inviterId)) {
			List<EventMemberBean> eventMemberList = event.getEventMemberList();
			List<MemberMainBean> attendList = new ArrayList<MemberMainBean>();
			List<EventMemberBean> eventMemberId = new ArrayList<EventMemberBean>();
			MemberMainBean eventMembers = null;
			
			Date timeNow = new Date();
			String endDate = event.getEventDateEnd();
			SimpleDateFormat format = new SimpleDateFormat();
			format.applyPattern("yyyy/MM/dd HH:mm");
			Date endTime = null;
			try {
				endTime = format.parse(endDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			boolean eventFinished = endTime.after(timeNow);
			
			for (EventMemberBean bean : eventMemberList) {
				if (bean.getIsAgreed() && !bean.getMemberId().equals(inviterId) && bean.getIsAttended() == null) {
					Integer memberid = bean.getMemberId();
					Integer id = bean.getEventMemberId();
					EventMemberBean eventMemberIds = eventService.getByEventMemberId(id);
					eventMembers = eventService.getByMemberId(memberid);
					attendList.add(eventMembers);
					eventMemberId.add(eventMemberIds);
				}
			}
			model.addAttribute("attendList", attendList);
			model.addAttribute("event", event);
			model.addAttribute("eventMemberId", eventMemberId);
			model.addAttribute("eventFinished", eventFinished);
			return "event/event_attended";
		} else {
			return "not_login";
		}
	}
	//出席 
	@RequestMapping(value = "/event/eventArrive/{eventId}")
	public @ResponseBody String arrive(Integer eventId, Integer eventMemberId, HttpSession session) {
		Integer memberId = (Integer) session.getAttribute("memberId");
		EventMainBean event = eventService.getByEventMainId(eventId);
		EventMemberBean bean = eventService.getByEventMemberId(eventMemberId);
		Integer inviterId = event.getEventInviterId();
		if (memberId != null && memberId.equals(inviterId)) {
			bean.setIsAttended(true);
			eventService.updateIsAgreed(bean);
			return "arrived";
		} else {
			return "not_login";
		}
	}
	// 未出席
	@RequestMapping(value = "/event/eventAbsent/{eventId}")
	public @ResponseBody String absent(Integer eventId, Integer eventMemberId, HttpSession session) {
		Integer memberId = (Integer) session.getAttribute("memberId");
		EventMainBean event = eventService.getByEventMainId(eventId);
		EventMemberBean bean = eventService.getByEventMemberId(eventMemberId);
		Integer inviterId = event.getEventInviterId();
		if (memberId != null && memberId.equals(inviterId)) {
			bean.setIsAttended(false);
			eventService.updateIsAgreed(bean);
			return "absent";
		} else {
			return "not_login";
		}
	}

//  檢舉/event/report/${event.eventId}/${attendList.memberId}
	@RequestMapping(value = "/event/postReport/{eventId}/{eventPostId}/{reportViolatorId}", method = RequestMethod.GET)
	public String eventPostReport(@PathVariable Integer reportViolatorId,@PathVariable Integer eventId,@PathVariable Integer eventPostId, Model model) {
		ReportBean rb = new ReportBean();
		MemberMainBean bean = eventService.getByMemberId(reportViolatorId);
		EventMainBean event = eventService.getByEventMainId(eventId);
		rb.setReportViolatorId(reportViolatorId);
		rb.setReportType("punish_event_post_eventPostId="+eventPostId);
		model.addAttribute("eventReportBean", rb);
		model.addAttribute("bean", bean);
		model.addAttribute("event", event);
		return "event/event_report";
	}
	@RequestMapping(value = "/event/attendReport/{eventId}/{memberId}", method = RequestMethod.GET)
	public String eventAttendReport(@PathVariable Integer eventId,@PathVariable Integer memberId, Model model) {
		ReportBean rb = new ReportBean();
		
		MemberMainBean bean = eventService.getByMemberId(memberId);
		EventMainBean event = eventService.getByEventMainId(eventId);
		
		
		rb.setReportViolatorId(memberId);
		rb.setReportType("punish_event_attend_eventId="+eventId);
		model.addAttribute("eventReportBean", rb);
		model.addAttribute("bean", bean);
		model.addAttribute("event", event);
		return "event/event_attend_report";

	}
	@RequestMapping(value ="/event/report/{eventId}", method = RequestMethod.POST)
	public String eventReportProcess(@ModelAttribute("eventReportBean")ReportBean rb,@PathVariable Integer eventId, RedirectAttributes redirectAttributes) {
		
		reportService.ReportBeanSave(rb);
		
		redirectAttributes.addFlashAttribute("success", "檢舉成功");
		
		return "redirect:/event/"+eventId;
	}
//	尚未登入前端判斷
	@RequestMapping("/not_Login")
	public String notLogin(HttpSession session) {

		return "not_login";

	}
}
