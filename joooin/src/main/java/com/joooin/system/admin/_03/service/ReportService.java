package com.joooin.system.admin._03.service;

import java.util.List;

import com.joooin.model.NotificationBean;
import com.joooin.model.ReportBean;
import com.joooin.system.admin._03.model.ReportPojo;

public interface ReportService {
	public void ReportBeanSave(ReportBean rb);
	public List<ReportBean> getAlldReportBean();
	public ReportBean getReportBean(Integer reportId);
	public void PunishmentBeanSave(Integer reportId, Integer punishMemberId, Integer punishDateEnd, String punishType);
	public void saveNotification(NotificationBean nb);
	public List<ReportPojo> getAllReportPojo();
}
