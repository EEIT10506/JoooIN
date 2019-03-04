package com.joooin.repository;

import java.util.List;
import com.joooin.model.ReportBean;

public interface ReportDao {
	public ReportBean getByReportId(Integer reportId);
	public List<ReportBean> getAll();
	public Integer save(ReportBean reportBean);
	public void update(ReportBean reportBean);
	public void deleteByReportId(Integer reportId);
}


