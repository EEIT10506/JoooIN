package com.joooin.system.member._27.service;

import java.util.List;

import com.joooin.model.MemberChatBean;
import com.joooin.model.MemberMainBean;

public interface MessageService {
	public MemberMainBean getFriendMemberMainBean(Integer memberId, String messageHash);
	public void saveTextMessage(Integer sendMemberId, Integer receiveMemberId, String messageHash, String text);
	public List<MemberChatBean> getMessage(String messageHash);
	public Integer singleFriendNotReadQuantity(Integer sendMemberId, Integer receiveMemberId);
	public Integer allFriendNotReadQuantity(Integer receiveMemberId);
}
