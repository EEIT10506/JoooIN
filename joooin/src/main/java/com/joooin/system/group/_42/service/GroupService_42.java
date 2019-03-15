package com.joooin.system.group._42.service;

import java.util.List;

import com.joooin.model.GroupMainBean;

public interface GroupService_42 {
	List<GroupMainBean> getAll();
	
	List<GroupMainBean> getGroupType(String groupOneType);
	
	
	
}
