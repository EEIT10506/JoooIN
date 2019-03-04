package com.joooin.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="punishment")
public class PunishmentBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer punishmentId;
	private Integer reportId;
	private Integer punishMemberId;
	private String punishDateStart;
	private String punishDateEnd;
	private String punishType;
	
	public PunishmentBean(Integer reportId, Integer punishMemberId, String punishDateStart, String punishDateEnd,
			String punishType) {
		super();
		this.reportId = reportId;
		this.punishMemberId = punishMemberId;
		this.punishDateStart = punishDateStart;
		this.punishDateEnd = punishDateEnd;
		this.punishType = punishType;
	}
	public PunishmentBean() {
		super();
	}
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getPunishmentId() {
		return punishmentId;
	}
	public void setPunishmentId(Integer punishmentId) {
		this.punishmentId = punishmentId;
	}
	public Integer getReportId() {
		return reportId;
	}
	public void setReportId(Integer reportId) {
		this.reportId = reportId;
	}
	public Integer getPunishMemberId() {
		return punishMemberId;
	}
	public void setPunishMemberId(Integer punishMemberId) {
		this.punishMemberId = punishMemberId;
	}
	public String getPunishDateStart() {
		return punishDateStart;
	}
	public void setPunishDateStart(String punishDateStart) {
		this.punishDateStart = punishDateStart;
	}
	public String getPunishDateEnd() {
		return punishDateEnd;
	}
	public void setPunishDateEnd(String punishDateEnd) {
		this.punishDateEnd = punishDateEnd;
	}
	public String getPunishType() {
		return punishType;
	}
	public void setPunishType(String punishType) {
		this.punishType = punishType;
	}
	
	
	
	
}
