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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joooin.model.EventLikeBean;
import com.joooin.model.EventMainBean;
import com.joooin.model.EventMemberBean;
import com.joooin.model.EventPostBean;
import com.joooin.model.EventTypeBean;
import com.joooin.model.MemberMainBean;
import com.joooin.repository.EventLikeDao;
import com.joooin.repository.EventMainDao;
import com.joooin.system.event._02.service.EventService;
import com.joooin.system.event._02.service.impl.GetPostContentBean;
import com.joooin.system.event._35.service.EventMainService;
import com.joooin.util.ImageUtils;


@Controller
public class EventController {
	@Autowired
	EventService eventService;
	@Autowired
	ServletContext context; 
	@Autowired
	EventLikeDao eventLikeDao;
	@Autowired
	EventMainService eventMainService;
	@RequestMapping(value = "/event/eventPost", method = RequestMethod.POST)
	public String submitEventPost(@RequestParam Integer eventId, @RequestParam String eventPostContent, HttpSession session) {
		Integer memberId = (Integer) session.getAttribute("memberId");
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
		
		Integer eventPostId = eventService.saveOneEventPost(eventPostBean);
		return "redirect:/event/"+eventId;
		}else {
			return "not_login";
		}
		
	}
	@RequestMapping(value = "/DeleteEventPost", method = RequestMethod.POST)
	public String deleteEventPost(@RequestParam Integer eventPostId, @RequestParam Integer eventId, HttpSession session) {
		Integer adminId = (Integer)session.getAttribute("admin");
		if (adminId != null) {
			EventPostBean eventPostBean = eventService.getByEventPostId(eventPostId);
					eventPostBean.setIsDeleted(true);
					eventService.updateEventPostIsDeleted(eventPostBean);
			return "redirect:/event/"+eventId;
		}else {
			return "not_login";
		}
	}
	@RequestMapping(value = "/event/eventCheckQuantity", method = RequestMethod.POST)
	public String checkQuantity(@RequestParam Integer eventId, @RequestParam String quantity, Model model, HttpSession session) {
		Integer memberId = (Integer) session.getAttribute("memberId");
		if (memberId != null) {
			EventMemberBean eventMemberBean = new EventMemberBean();
			
			Integer quantitys = Integer.parseInt(quantity);
			eventMemberBean.setEventId(eventId);
			eventMemberBean.setMemberId(memberId);
			eventMemberBean.setQuantity(quantitys);
			eventMemberBean.setIsPaid(null);
			eventMemberBean.setIsAgreed(false);
			eventMemberBean.setIsAttended(true);
			Integer i = eventService.saveEventMember(eventMemberBean);
		
		    return "redirect:/event/"+eventId;
		}else {
			return "not_login";
		}
	}
	@RequestMapping(value = "/DeleteByEventMemberId", method = RequestMethod.POST)
	public String deleteByEventMemberId(@RequestParam Integer eventId,HttpSession session, Model model ) {
		Integer memberId = (Integer) session.getAttribute("memberId");
		if (memberId != null) {
			eventService.deleteEventMemberById(eventId, memberId);
			return "redirect:/event/"+eventId;
		}else {
			return "not_login";
		}
	}
	@RequestMapping("/event/{eventId}")
	public String eventDetail(@PathVariable("eventId") Integer eventId,Model model,HttpSession session) {
		Integer memberId = (Integer) session.getAttribute("memberId");
		
		EventMainBean event = eventService.getByEventMainId(eventId);
		Integer typeid = event.getEventTypeId();
		Integer inviterid = event.getEventInviterId();
		
		List<EventMemberBean> emlist = event.getEventMemberList();
		List<Integer> emidlist = new LinkedList<Integer>();
		for(EventMemberBean em:emlist) {
			emidlist.add(em.getMemberId());
		}
		boolean memberCheck = emidlist.contains(memberId);
		
		EventTypeBean eventtype = eventService.getByEventTypeId(typeid);
		MemberMainBean eventbuildname = eventService.getByMemberId(inviterid);
		
		List<EventMemberBean> eventmember = event.getEventMemberList();
		
		MemberMainBean eventmembers = null;
		List<MemberMainBean> eventmemberlist = new ArrayList<MemberMainBean>();
		List<MemberMainBean> emfindagreed = new ArrayList<MemberMainBean>();
		
		for(EventMemberBean members: eventmember) {
			Integer memberid = members.getMemberId();
			eventmembers  = eventService.getByMemberId(memberid);
			eventmemberlist.add(eventmembers);
			Boolean isAgreed = members.getIsAgreed();
			if(isAgreed == true) {
				emfindagreed.add(eventmembers);
			}
		}
		
		List<EventPostBean> eventPost = event.getEventPostList();
		List<GetPostContentBean> getPostContentlist =new ArrayList<>();
		
		for(EventPostBean postMember: eventPost) {
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
		model.addAttribute("event", event);
		model.addAttribute("eventtype", eventtype);
		model.addAttribute("eventbuildname", eventbuildname);
		model.addAttribute("inviterid", inviterid);
		model.addAttribute("eventmember", eventmember);
		model.addAttribute("eventmembers", eventmemberlist);
		model.addAttribute("eventPost", eventPost);
		model.addAttribute("memberCheck", memberCheck);
		model.addAttribute("emfindagreed", emfindagreed);
		
		return "event/event";
	}
	
	@RequestMapping(value = "/event/good/{eventId}", method = RequestMethod.POST)
	public @ResponseBody String giveEventLike(Integer eventId,HttpSession session) {
		Integer memberId = (Integer) session.getAttribute("memberId");
		if(memberId != null) { 
			List<EventLikeBean> list = eventLikeDao.getAll();
			int count = 0;
			for (EventLikeBean eventLikeBean:list) {
				if(eventLikeBean.getEventId().equals(eventId) && eventLikeBean.getMemberId().equals(memberId)) {
					eventLikeDao.deleteByEventLikeId(eventLikeBean.getEventLikeId());
					
					EventMainBean updateEvent = eventMainService.getByEventMainId(eventId);
					Integer like = updateEvent.getEventLike();
					int updatelike =(like.intValue()-1);
					Integer reallike = Integer.valueOf(updatelike);
				
					
					updateEvent.setEventLike(reallike);
					eventMainService.save(updateEvent);
					count++;
					break;
				}
			}
			if(count==0) {
				EventLikeBean eventLikeBean = new EventLikeBean();
					eventLikeBean.setEventId(eventId);
					eventLikeBean.setMemberId(memberId);
					eventLikeDao.save(eventLikeBean);
					Integer like = eventMainService.getByEventMainId(eventId).getEventLike();
			 
					int updatelike = like.intValue()+1;
					Integer reallike = Integer.valueOf(updatelike);

				EventMainBean updateEvent = eventMainService.getByEventMainId(eventId);
					updateEvent.setEventLike(reallike);
					eventMainService.save(updateEvent);
					return "liked";
			}
			else {
				return "cancel_Liked";
			}	
	    }else {  
	    	return "notLogin";}
	
	}
//	@RequestMapping(value = "/event/setting", method = RequestMethod.POST)
//	public String eventManager(@ModelAttribute("memberMainBean") MemberMainBean updateBean, HttpSession session) {
//		Integer memberId = (Integer)session.getAttribute("memberId");
//		
//		if (memberId != null) {
//			MemberMainBean mmb = memberService.getMemberMainBean(memberId);
//			mmb.setMemberName(updateBean.getMemberName());
//			mmb.setBirthday(updateBean.getBirthday());
//			mmb.setCity(updateBean.getCity());
//			mmb.setPhone(updateBean.getPhone());
//			
//			Byte[] memberImage = null;
//			if (!updateBean.getMultipartFile().isEmpty()) {
//				memberImage = ImageUtils.multipartFileToByteArray(updateBean.getMultipartFile());
//				mmb.setMemberImage(memberImage);
//			} else {
//				mmb.setMemberImage(ImageUtils.localImageToByteArray("member_male.PNG", context));
//			}
//			memberService.updateMemberMainBean(mmb);
//			session.setAttribute("memberName", mmb.getMemberName());
//			
//			return "redirect:/member/my/profile";
//		} else {
//			return "not_login";
//		}	
//	}					
	//活動修改
	@RequestMapping("/event/setting")
	public String eventSetting(Model model, @RequestParam("eventAdminId") Integer eventId) {
		EventMainBean event = eventService.getByEventMainId(eventId);

//		Integer typeid = event.getEventTypeId();
//		EventTypeBean eventtype = eventService.getByEventTypeId(typeid);
//		String eventType = eventtype.getEventType();
		model.addAttribute("events", event);
//		model.addAttribute("eventtype", eventtype);
		return "event/event_setting";
	}
	
}
