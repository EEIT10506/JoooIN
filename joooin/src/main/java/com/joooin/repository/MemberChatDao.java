package com.joooin.repository;

import java.util.List;
import com.joooin.model.MemberChatBean;

public interface MemberChatDao {
	public MemberChatBean getByMemberChatId(Integer memberChatId);
	public List<MemberChatBean> getAll();
	public Integer save(MemberChatBean memberChatBean);
	public void update(MemberChatBean memberChatBean);
	public void deleteByMemberChatId(Integer memberChatId);
}
