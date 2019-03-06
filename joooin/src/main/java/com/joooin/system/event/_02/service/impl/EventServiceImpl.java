package com.joooin.system.event._02.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.joooin.model.EventMainBean;
import com.joooin.repository.EventMainDao;
import com.joooin.system.event._02.service.EventService;
@Service
@Transactional
public class EventServiceImpl implements EventService {
	
	@Autowired
	EventMainDao dao;
	@Override
	public EventMainBean getByEventMainId(Integer eventId) {
		return dao.getByEventMainId(eventId);
	}

	@Override
	public List<EventMainBean> getAll() {
		
		return null;
	}

	@Override
	public Integer save(EventMainBean eventMainBean) {
	
		return null;
	}

	@Override
	public void update(EventMainBean eventMainBean) {
	
		
	}

	@Override
	public void deleteByEventId(Integer eventId) {
	
		
	}
		
}
