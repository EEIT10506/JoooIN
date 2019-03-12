package com.joooin.system.event._35.service.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.joooin.model.EventTypeBean;
import com.joooin.repository.EventTypeDao;
import com.joooin.system.event._35.service.EventTypeService;

@Service
@Transactional
public class EventTypeServiceImpl implements EventTypeService {

		@Autowired
		SessionFactory factory;
		
		@Autowired
		EventTypeDao dao;
		
		@Override
		public EventTypeBean getByEventTypeId(Integer eventTypeId) {
		
			return dao.getByEventTypeId(eventTypeId);
		}


		@Override
		public List<EventTypeBean> getAll() {
			return dao.getAll();
		}

		@Override
		public Integer save(EventTypeBean eventTypeBean) {
			
			return dao.save(eventTypeBean);
		}

		@Override
		public void update(EventTypeBean eventTypeBean) {
			dao.update(eventTypeBean);;
		}

		@Override
		public void deleteByEventTypeId(Integer eventTypeId) {
			dao.deleteByEventTypeId(eventTypeId);;
		}
		

}
