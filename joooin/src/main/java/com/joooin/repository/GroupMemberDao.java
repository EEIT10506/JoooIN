package com.joooin.repository;

import java.util.List;
import com.joooin.model.GroupMemberBean;

public interface GroupMemberDao {
	public GroupMemberBean getByGroupMemberId(Integer groupMemberId);
	public List<GroupMemberBean> getAll();
	public Integer save(GroupMemberBean groupMemberBean);
	public void update(GroupMemberBean groupMemberBean);
	public void deleteByGroupMemberId(Integer groupMemberId);
}
