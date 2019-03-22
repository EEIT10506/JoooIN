package com.joooin.repository;

import java.util.List;

import com.joooin.model.GroupMainBean;
import com.joooin.system.admin._03.model.AllGroupQuantityBean;

public interface GroupMainDao {
	public GroupMainBean getByGroupId(Integer groupId);
	public List<GroupMainBean> getAll();
	public Integer save(GroupMainBean groupMainBean);
	public void update(GroupMainBean groupMainBean);
	public void deleteByGroupId(Integer groupId);
	List<GroupMainBean> getGroupType(String groupOneType);
	public List<AllGroupQuantityBean> getAllGroupQuantity();
	
}
