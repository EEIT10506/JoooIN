package com.joooin.system.admin._03.model;

public class ReportPojo {
	
	private Integer reportId;
	private String reportDate;
	private String reportMember;
	private String reportViolator;
	private String reportType;
	private String reportContent;
	private Boolean isDone;
	public Integer getReportId() {
		return reportId;
	}
	public void setReportId(Integer reportId) {
		this.reportId = reportId;
	}
	public String getReportDate() {
		return reportDate;
	}
	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}
	public String getReportMember() {
		return reportMember;
	}
	public void setReportMember(String reportMember) {
		this.reportMember = reportMember;
	}
	public String getReportViolator() {
		return reportViolator;
	}
	public void setReportViolator(String reportViolator) {
		this.reportViolator = reportViolator;
	}
	public String getReportType() {
		return reportType;
	}
	public void setReportType(String reportType) {
		this.reportType = reportType;
	}
	public String getReportContent() {
		return reportContent;
	}
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}
	public Boolean getIsDone() {
		return isDone;
	}
	public void setIsDone(Boolean isDone) {
		this.isDone = isDone;
	}

	
}
