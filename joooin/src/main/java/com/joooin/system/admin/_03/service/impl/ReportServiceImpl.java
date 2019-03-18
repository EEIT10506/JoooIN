package com.joooin.system.admin._03.service.impl;

import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.joooin.model.ReportBean;
import com.joooin.repository.ReportDao;
import com.joooin.system.admin._03.service.ReportService;

@Service
@Transactional
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	ReportDao reportDao;

	@Override
	public void ReportBeanSave(ReportBean rb) {
		reportDao.save(rb);
	}

	@Override
	public List<ReportBean> getUnprocessedReportBean() {
		List<ReportBean> list = reportDao.getAll();
		List<ReportBean> rb = new LinkedList<>();
		for(ReportBean reportBean : list) {
			if(reportBean.getIsDone()==false);
			rb.add(reportBean);
		}
		return rb;
	}

}
