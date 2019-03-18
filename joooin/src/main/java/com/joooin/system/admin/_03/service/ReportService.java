package com.joooin.system.admin._03.service;

import java.util.List;

import com.joooin.model.ReportBean;

public interface ReportService {
	public void ReportBeanSave(ReportBean rb);
	public List<ReportBean> getUnprocessedReportBean();
}
