package com.joooin.repository;

import java.util.List;
import com.joooin.model.GroupMainBean;

public interface GroupMainDao {
	public GroupMainBean getByGroupId(Integer groupId);
	public List<GroupMainBean> getAll();
	public Integer save(GroupMainBean groupMainBean);
	public void update(GroupMainBean groupMainBean);
	public void delete(GroupMainBean groupMainBean);
	public void deleteByGroupId(Integer groupId);
	List<GroupMainBean> getgrouptype(String grouponetype);
	
}
