package com.joooin.system.group.service;

import java.util.List;

import com.joooin.model.GroupMainBean;

public interface GroupService {
	List<GroupMainBean> getAll();
	
	List<GroupMainBean> getGroupType(String groupOneType);
	
	Integer createGroup(GroupMainBean groupMainBean);
}
