package com.joooin.repository;

import java.util.List;
import com.joooin.model.GroupChatBean;

public interface GroupChatDao {
	public GroupChatBean getByGroupChatId(Integer groupChatId);
	public List<GroupChatBean> getAll();
	public Integer save(GroupChatBean groupChatBean);
	public void update(GroupChatBean groupChatBean);
	public void deleteByGroupChatId(Integer groupChatId);
}


