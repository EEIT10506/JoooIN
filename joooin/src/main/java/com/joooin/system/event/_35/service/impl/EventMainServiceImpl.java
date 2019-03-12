package com.joooin.system.event._35.service.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.joooin.model.EventMainBean;
import com.joooin.repository.EventMainDao;
import com.joooin.system.event._35.service.EventMainService;


@Service
@Transactional
public class EventMainServiceImpl implements EventMainService {

	@Autowired
	SessionFactory factory;
	
	@Autowired
	EventMainDao dao;
	
	@Override
	public EventMainBean getByEventMainId(Integer eventId) {		
		return dao.getByEventMainId(eventId);
	}

	@Override
	public List<EventMainBean> getAll() {
		return dao.getAll();
	}

	@Override
	public Integer save(EventMainBean eventMainBean) {
		return dao.save(eventMainBean);
	}

	@Override
	public void update(EventMainBean eventMainBean) {
         dao.update(eventMainBean);
	}

	@Override
	public void deleteByEventId(Integer eventId) {
		dao.deleteByEventId(eventId);
	}
	
}
