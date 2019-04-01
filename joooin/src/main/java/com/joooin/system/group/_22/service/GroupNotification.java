package com.joooin.system.group._22.service;

public interface GroupNotification {
	public void groupNotifJoined(Integer selfId, Integer groupId);
	public void groupNotifReject(Integer selfId, Integer groupId);
	public void groupNotifRequest(Integer groupId);
}
