package com.joooin.model;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="report")
public class ReportBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer reportId;
	private String reportDate;
	private Integer reportMemberId;
	private Integer reportViolatorId;
	private String reportType;
	private String reportContent;
	private Boolean isDone;
	private Set<PunishmentBean> punishmentSet = new LinkedHashSet<PunishmentBean>();
	
	public ReportBean(String reportDate, Integer reportMemberId, Integer reportViolatorId, String reportType,
			String reportContent, Boolean isDone) {
		super();
		this.reportDate = reportDate;
		this.reportMemberId = reportMemberId;
		this.reportViolatorId = reportViolatorId;
		this.reportType = reportType;
		this.reportContent = reportContent;
		this.isDone = isDone;
	}
	public ReportBean() {
		super();
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="reportId", referencedColumnName="reportId")
	public Set<PunishmentBean> getPunishmentSet() {
		return punishmentSet;
	}
	public void setPunishmentSet(Set<PunishmentBean> punishmentSet) {
		this.punishmentSet = punishmentSet;
	}
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
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
	public Integer getReportMemberId() {
		return reportMemberId;
	}
	public void setReportMemberId(Integer reportMemberId) {
		this.reportMemberId = reportMemberId;
	}
	public Integer getReportViolatorId() {
		return reportViolatorId;
	}
	public void setReportViolatorId(Integer reportViolatorId) {
		this.reportViolatorId = reportViolatorId;
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
