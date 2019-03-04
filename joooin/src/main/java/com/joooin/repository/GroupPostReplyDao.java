package com.joooin.repository;

import java.util.List;
import com.joooin.model.GroupPostReplyBean;

public interface GroupPostReplyDao {
	public GroupPostReplyBean getByGroupPostReplyId(Integer groupPostReplyId);
	public List<GroupPostReplyBean> getAll();
	public Integer save(GroupPostReplyBean groupPostReplyBean);
	public void update(GroupPostReplyBean groupPostReplyBean);
	public void deleteByGroupPostReplyId(Integer groupPostReplyId);
}


