package com.joooin.system.group._22.service;

import java.util.List;

import com.joooin.model.GroupMainBean;

public interface GroupService {
	List<GroupMainBean> getAll();
	Integer createGroup(GroupMainBean groupMainBean);
}
