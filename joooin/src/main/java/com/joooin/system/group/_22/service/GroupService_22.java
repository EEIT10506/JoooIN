package com.joooin.system.group._22.service;

import java.util.List;

import com.joooin.model.GroupMainBean;
import com.joooin.model.MemberMainBean;

public interface GroupService_22 {
	public GroupMainBean getByGroupId(Integer groupId);
	
	Integer createGroup(GroupMainBean groupMainBean);
	
	String leaderOfGroup(Integer groupId);
	
	boolean isInGroup(Integer groupId, Integer memberId);
	
	void memberAddToGroup(Integer groupId, Integer memberId);
	
	void leaderAddToGroup(Integer groupId, Integer memberId);
	
	List<MemberMainBean> processGroupApply(Integer groupId);
}
