package com.joooin.repository;

import java.util.List;
import com.joooin.model.GroupPostBean;

public interface GroupPostDao {
	public GroupPostBean getByGroupPostId(Integer groupPostId);
	public List<GroupPostBean> getAll();
	public Integer save(GroupPostBean groupPostBean);
	public void update(GroupPostBean groupPostBean);
	public void deleteByGroupPostId(Integer groupPostId);
}


