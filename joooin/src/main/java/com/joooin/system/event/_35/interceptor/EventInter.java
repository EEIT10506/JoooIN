package com.joooin.system.event._35.interceptor;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.joooin.model.EventMainBean;
import com.joooin.model.EventMemberBean;
import com.joooin.system.event._35.service.EventsService;

public class EventInter implements HandlerInterceptor {
	
    SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy/MM/dd HH:mm");
    
    @Autowired
    EventsService  eventsService;

    @Autowired
	ServletContext context;
    
    

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		List<EventMainBean> eventList = eventsService.getAll();
		Iterator<EventMainBean> iterator = eventList.iterator();

        Date now = new Date();
        Date eventEndDate = null;
	     while(iterator.hasNext()) {  			    	
	    	 EventMainBean event = iterator.next();		
	    	 eventEndDate = sdf1.parse(event.getEventDateEnd());
	    	 String status = event.getEventStatus();
	    	 if(now.after(eventEndDate) && status.equals("unchecked")) { 
	    		 event.setEventStatus("no");
	    		 eventsService.update(event);
	    		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	    		 Date nowdate = new Date();
	    		 String eventupdate = sdf.format(nowdate);
	    		 String notificationContent = "event_modified_eventId=" + event.getEventId();
	    		 List<EventMemberBean> eventMemberList = event.getEventMemberList();
	    		 Iterator<EventMemberBean> eventMemberiterator = eventMemberList.iterator();
	    		 while(eventMemberiterator.hasNext()) {
	    			 EventMemberBean eventMember = eventMemberiterator.next();	
	    			 Integer myMember_memberId = eventMember.getMemberId();
	    			 eventsService.addnotification(myMember_memberId, notificationContent, eventupdate, false);
	    		 }
	         } 	
	     }
	
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
