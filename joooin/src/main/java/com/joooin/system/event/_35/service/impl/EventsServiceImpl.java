package com.joooin.system.event._35.service.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.joooin.model.EventLikeBean;
import com.joooin.model.EventMainBean;
import com.joooin.repository.EventLikeDao;
import com.joooin.repository.EventMainDao;
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
				return "y"+reallike; //有按過讚的顏色+回傳讚數
			}
		}
		if (count == 0) {
			Integer like = eventDao.getByEventMainId(eventId).getEventLike();

			reallike = Integer.valueOf(like);

			return "n"+reallike;   //沒按過讚的顏色+回傳讚數
		} else {
			return "n"+eventDao.getByEventMainId(eventId).getEventLike();  //沒登入的顏色+回傳讚數
		}
		
		
	}
}
