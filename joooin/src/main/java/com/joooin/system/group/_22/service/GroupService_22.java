package com.joooin.system.group._22.service;

import com.joooin.model.GroupMainBean;

public interface GroupService_22 {
	public GroupMainBean getByGroupId(Integer groupId);
	
	Integer createGroup(GroupMainBean groupMainBean);
	//
}
