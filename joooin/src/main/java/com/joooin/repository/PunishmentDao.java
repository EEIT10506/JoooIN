package com.joooin.repository;

import java.util.List;
import com.joooin.model.PunishmentBean;

public interface PunishmentDao {
	public PunishmentBean getByPunishmentId(Integer punishmentId);
	public List<PunishmentBean> getAll();
	public Integer save(PunishmentBean punishmentBean);
	public void update(PunishmentBean punishmentBean);
	public void deleteByPunishmentId(Integer punishmentId);
}


