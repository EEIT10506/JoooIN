package com.joooin.repository;

import java.util.List;
import com.joooin.model.AdminBean;

public interface AdminDao {
	public AdminBean getByAdminId(Integer adminId);
	public List<AdminBean> getAll();
	public Integer save(AdminBean adminBean);
	public void update(AdminBean adminBean);
	public void deleteByAdminId(Integer adminId);
}


