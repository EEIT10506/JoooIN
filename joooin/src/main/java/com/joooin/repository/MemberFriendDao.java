package com.joooin.repository;

import java.util.List;
import com.joooin.model.MemberFriendBean;

public interface MemberFriendDao {
	public MemberFriendBean getByMemberFriendId(Integer memberFriendId);
	public List<MemberFriendBean> getAll();
	public Integer save(MemberFriendBean memberFriendBean);
	public void update(MemberFriendBean memberFriendBean);
	public void deleteByMemberFriendId(Integer memberFriendId);
}
