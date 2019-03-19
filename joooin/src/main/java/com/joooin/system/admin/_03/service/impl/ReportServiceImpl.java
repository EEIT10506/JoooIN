package com.joooin.system.admin._03.service.impl;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.joooin.model.PunishmentBean;
import com.joooin.model.ReportBean;
import com.joooin.repository.PunishmentDao;
import com.joooin.repository.ReportDao;
import com.joooin.system.admin._03.service.ReportService;

@Service
@Transactional
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	ReportDao reportDao;
	
	@Autowired
	PunishmentDao punishmentDao;

	@Override
	public void ReportBeanSave(ReportBean rb) {
		reportDao.save(rb);
	}

	@Override
	public List<ReportBean> getAlldReportBean() {
		List<ReportBean> list = reportDao.getAll();
		return list;
	}

	@Override
	public ReportBean getReportBean(Integer reportId) {
		return reportDao.getByReportId(reportId);
	}

	@Override
	public void PunishmentBeanSave(Integer reportId, Integer punishMemberId, Integer punishDateEnd, String punishType) {
		PunishmentBean pb = new PunishmentBean();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd ahh:mm:ss");
		pb.setPunishDateStart(sdf.format(new Date()).toString());
		
		Date dt = new Date();
		Calendar c = Calendar.getInstance(); 
		c.setTime(dt); 
		c.add(Calendar.DATE, punishDateEnd);
		dt = c.getTime();
//		LocalDateTime.from(dt.toInstant()).plusDays(punishDateEnd);
		pb.setPunishDateEnd(sdf.format(dt).toString());
		pb.setPunishMemberId(punishMemberId);
		pb.setPunishType(punishType);
		pb.setReportId(reportId);
		punishmentDao.save(pb);
		
	}

}
