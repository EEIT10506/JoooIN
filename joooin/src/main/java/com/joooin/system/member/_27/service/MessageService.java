package com.joooin.system.member._27.service;

import java.util.List;

import com.joooin.model.MemberChatBean;
import com.joooin.model.MemberMainBean;
import com.joooin.system.member._27.pojo.FriendPojo;

public interface MessageService {
	public MemberMainBean getFriendMemberMainBean(Integer memberId, String messageHash);
	public void saveTextMessage(Integer sendMemberId, Integer receiveMemberId, String messageHash, String text);
	public List<MemberChatBean> getOneFriendMessage(String messageHash);
	public Integer getOneFriendNotReadQuantity(Integer sendMemberId, Integer receiveMemberId);
	public Integer getAllFriendNotReadQuantity(Integer receiveMemberId);
	public void setMessageRead(Integer receiveMemberId, String messageHash);
	public String getOneFriendLastMessage(String messageHash);
	public Integer getOneFriendLastMessageId(String messageHash);
	public List<FriendPojo> getFriendsOnMessagePage(Integer memberId);
}
