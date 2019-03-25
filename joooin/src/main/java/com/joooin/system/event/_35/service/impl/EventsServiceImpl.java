package com.joooin.system.event._35.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.joooin.model.EventLikeBean;
import com.joooin.model.EventMainBean;
import com.joooin.model.GroupMainBean;
import com.joooin.model.GroupPostBean;
import com.joooin.model.NotificationBean;
import com.joooin.repository.EventLikeDao;
import com.joooin.repository.EventMainDao;
import com.joooin.repository.GroupMainDao;
import com.joooin.repository.GroupPostDao;
import com.joooin.repository.NotificationDao;
import com.joooin.system.event._35.service.EventsService;

@Service
@Transactional
public class EventsServiceImpl implements EventsService {

	@Autowired
	SessionFactory factory;

	@Autowired
	EventMainDao eventDao;

	@Autowired
	EventLikeDao eventLikeDao;
	
	@Autowired
    GroupMainDao groupMainDao;
	
	@Autowired
	GroupPostDao groupPostDao;
	
	@Autowired
	NotificationDao notificationDao;

	@Override
	public EventMainBean getByEventMainId(Integer eventId) {
		return eventDao.getByEventMainId(eventId);
	}

	@Override
	public List<EventMainBean> getAll() {
		return eventDao.getAll();
	}

	@Override
	public Integer save(EventMainBean eventMainBean) {
		return eventDao.save(eventMainBean);
	}

	@Override
	public void update(EventMainBean eventMainBean) {
		eventDao.update(eventMainBean);
	}

	@Override
	public void deleteByEventId(Integer eventId) {
		eventDao.deleteByEventId(eventId);
	}

	@Override
	public Integer processeventlike(Integer eventId, Integer memberId) {
		List<EventLikeBean> list = eventLikeDao.getAll();
		int count = 0;
		Integer reallike = -5;
		for (EventLikeBean eventLikeBean : list) {
			if (eventLikeBean.getEventId().equals(eventId) && eventLikeBean.getMemberId().equals(memberId)) {
				eventLikeDao.deleteByEventLikeId(eventLikeBean.getEventLikeId());
				Integer like = eventDao.getByEventMainId(eventId).getEventLike();
				int updatelike = (like.intValue() - 1);
				reallike = Integer.valueOf(updatelike);

				EventMainBean updateEvent = eventDao.getByEventMainId(eventId);
				updateEvent.setEventLike(reallike);
				eventDao.save(updateEvent);
				count++;
				break;
			}
		}
		if (count == 0) {
			EventLikeBean eventLikeBean = new EventLikeBean();
			eventLikeBean.setEventId(eventId);
			eventLikeBean.setMemberId(memberId);
			eventLikeDao.save(eventLikeBean);
			Integer like = eventDao.getByEventMainId(eventId).getEventLike();

			int updatelike = like.intValue() + 1;
			reallike = Integer.valueOf(updatelike);

			EventMainBean updateEvent = eventDao.getByEventMainId(eventId);
			updateEvent.setEventLike(reallike);
			eventDao.save(updateEvent);
			return reallike;
		} else {
			return reallike;
		}
	}

	@Override
	public String displayeventlike(Integer eventId, Integer memberId) {
		List<EventLikeBean> list = eventLikeDao.getAll();
		int count = 0;
		Integer reallike = -5;
		for (EventLikeBean eventLikeBean : list) {
			if (eventLikeBean.getEventId().equals(eventId) && eventLikeBean.getMemberId().equals(memberId)) {
				Integer like = eventDao.getByEventMainId(eventId).getEventLike();
				reallike = Integer.valueOf(like);
				count++;
				return "y" + reallike; // 有按過讚的顏色+回傳讚數
			}
		}
		if (count == 0) {
			Integer like = eventDao.getByEventMainId(eventId).getEventLike();

			reallike = Integer.valueOf(like);

			return "n" + reallike; // 沒按過讚的顏色+回傳讚數
		} else {
			return "n" + eventDao.getByEventMainId(eventId).getEventLike(); // 沒登入的顏色+回傳讚數
		}
	}
	@Override
	public List<EventMainBean> getTop8Events() {
        Date today = new Date();
	    SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy/MM/dd HH:mm");
	    
		List<EventMainBean> events = eventDao.getAll();		
		Iterator<EventMainBean> iterator = events.iterator();  
	     while(iterator.hasNext()) {  
	    	  Date endDate;
	    	  EventMainBean event = iterator.next();
			try {
				endDate = sdf1.parse(event.getEventDateEnd());
		         if(endDate.before(today) || event.getEventStatus().equals("no")) {  
		             iterator.remove();  
		         }  
			} catch (ParseException e) {
				e.printStackTrace();
			}  	
	     }  
		
		List<EventMainBean> top8Events = new LinkedList<EventMainBean>();
		Collections.sort(events, new Comparator<EventMainBean>() {
			public int compare(EventMainBean o1, EventMainBean o2) {
				return o2.getEventLike().compareTo(o1.getEventLike());
			}
		});
		if (events.size() >= 9) {
			for (int i = 0; i <= 8; i++) {
				top8Events.add(events.get(i));
			}return top8Events;
		} else {
			for (int i = 0; i < events.size(); i++) {
				top8Events.add(events.get(i));
			}
			return top8Events;
		}
        //return null;
	}
	
	@Override
	public List<GroupMainBean> getTop8Groups() {

		List<GroupMainBean> groups = groupMainDao.getAll();
		List<GroupMainBean> top8Groups = new LinkedList<GroupMainBean>();
		Collections.sort(groups, new Comparator<GroupMainBean>() {
			public int compare(GroupMainBean o1, GroupMainBean o2) {
				return o2.getGroupCurrentMembers().compareTo(o1.getGroupCurrentMembers());
			}
		});
		if (groups.size() >= 9) {
			for (int i = 0; i <= 8; i++) {
				top8Groups.add(groups.get(i));
			}return top8Groups;
		}else {
			for (int i = 0; i < groups.size(); i++) {
				top8Groups.add(groups.get(i));
			}return top8Groups;
			
		} 
        //return null;
	}
	
	@Override
	public List<GroupPostBean> getTop8GroupPosts() {

		List<GroupPostBean> groupPosts = groupPostDao.getAll();
		List<GroupPostBean> top8GroupPosts = new LinkedList<GroupPostBean>();		
		Collections.sort(groupPosts, new Comparator<GroupPostBean>() {
			public int compare(GroupPostBean o1, GroupPostBean o2) {
				return o2.getGroupPostLike().compareTo(o1.getGroupPostLike());
			}
		});
		if (groupPosts.size() >= 9) {
			for (int i = 0; i <= 8; i++) {
				top8GroupPosts.add(groupPosts.get(i));
			}return top8GroupPosts;
		} 
		else {
			for (int i = 0; i < groupPosts.size(); i++) {
				top8GroupPosts.add(groupPosts.get(i));
			}return top8GroupPosts;
			
		}
        //return null;
	}
	
	public NotificationBean addnotification(Integer memberId, String notificationContent, String notificationDate, Boolean isRead) {
		NotificationBean notification = new NotificationBean(memberId,notificationContent,notificationDate,isRead);
		notificationDao.save(notification);
		return	notification;

	}
	
}
