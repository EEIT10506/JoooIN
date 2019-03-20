package com.joooin.system.group._42.service;

import java.util.List;

import javax.servlet.ServletContext;

import com.joooin.model.GroupMainBean;

public interface GroupService_42 {
	List<GroupMainBean> getAll();
	
	List<GroupMainBean> getGroupType(String groupOneType);
	
	public void updateGroupType(Integer groupId, String type);
	
	public void updateGroupName(Integer groupId, String groupname);
	
	public void updateGroupIntro(Integer groupId, String groupintro);
}
