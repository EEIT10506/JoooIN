package com.joooin.repository;

import java.util.List;
import com.joooin.model.GroupPostLikeBean;

public interface GroupPostLikeDao {
	public GroupPostLikeBean getByGroupPostLikeId(Integer groupPostLikeId);
	public List<GroupPostLikeBean> getAll();
	public Integer save(GroupPostLikeBean groupPostLikeBean);
	public void update(GroupPostLikeBean groupPostLikeBean);
	public void deleteByGroupPostLikeId(Integer groupPostLikeId);
}


