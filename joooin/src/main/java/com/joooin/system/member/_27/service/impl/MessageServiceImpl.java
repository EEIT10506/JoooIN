package com.joooin.system.member._27.service.impl;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joooin.model.MemberChatBean;
import com.joooin.model.MemberFriendBean;
import com.joooin.model.MemberMainBean;
import com.joooin.repository.MemberChatDao;
import com.joooin.repository.MemberFriendDao;
import com.joooin.repository.MemberMainDao;
import com.joooin.system.member._27.pojo.FriendPojo;
import com.joooin.system.member._27.service.MemberService;
import com.joooin.system.member._27.service.MessageService;

@Service
@Transactional
public class MessageServiceImpl implements MessageService {

	@Autowired
	MemberService memberService;
	@Autowired
	MemberFriendDao memberFriendDao;
	@Autowired
	MemberChatDao memberChatDao;
	@Autowired
	MemberMainDao memberMainDao;

	
	@Override
	public MemberMainBean getFriendMemberMainBean(Integer memberId, String messageHash) {
		List<MemberFriendBean> list = memberFriendDao.getAll();
		Integer friendId = null;
		
		for (MemberFriendBean bean : list) {
			if (bean.getInviteMemberId().equals(memberId) && bean.getMessageHash().equals(messageHash)) {
				friendId = bean.getReceiveMemberId(); break;
			}
		}
		if (friendId != null) {
			return memberService.getMemberMainBean(friendId);
		} else {
			return null;
		}
	}

	@Override
	public void saveTextMessage(Integer sendMemberId, Integer receiveMemberId, String messageHash, String text) {
		MemberChatBean bean = new MemberChatBean();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String sd = sdf.format(date);	
		
		bean.setSendMemberId(sendMemberId);
		bean.setReceiveMemberId(receiveMemberId);
		bean.setMessageText(text);
		bean.setMessageDate(sd);
		bean.setMessageHash(messageHash);
		bean.setMessageType("text");
		bean.setIsRead(false);
		memberChatDao.save(bean);
	}

	@Override
	public List<MemberChatBean> getOneFriendMessage(String messageHash) {
		return memberChatDao.getByMessageHash(messageHash);
	}

	@Override
	public Integer getOneFriendNotReadQuantity(Integer sendMemberId, Integer receiveMemberId) {
		List<MemberChatBean> list = memberChatDao.getBySendAndReceiveMemberId(sendMemberId, receiveMemberId);
		Integer quantity = 0;
		
		for (MemberChatBean bean : list) {
			if (bean.getSendMemberId().equals(sendMemberId) && bean.getReceiveMemberId().equals(receiveMemberId) && !bean.getIsRead())
				quantity++;
		}
		return quantity;
	}

	@Override
	public Integer getAllFriendNotReadQuantity(Integer receiveMemberId) {
		List<MemberChatBean> list = memberChatDao.getAll();
		Integer quantity = 0;
		
		for (MemberChatBean bean : list) {
			if (bean.getReceiveMemberId().equals(receiveMemberId) && !bean.getIsRead())
				quantity++;
		}
		return quantity;
	}

	@Override
	public void setMessageRead(Integer receiveMemberId, String messageHash) {
		List<MemberChatBean> list = memberChatDao.getByMessageHash(messageHash);
		
		for (MemberChatBean bean : list) {
			if (bean.getReceiveMemberId().equals(receiveMemberId) && bean.getMessageHash().equals(messageHash) && !bean.getIsRead())
				bean.setIsRead(true);
		}
	}

	@Override
	public String getOneFriendLastMessage(String messageHash) {
		List<MemberChatBean> list = memberChatDao.getByMessageHash(messageHash);

		if (list.size() != 0)
			return list.get(list.size() - 1).getMessageText();
		else
			return null;
	}
	
	@Override
	public Integer getOneFriendLastMessageId(String messageHash) {
		List<MemberChatBean> list = memberChatDao.getByMessageHash(messageHash);
		
		if (list.size() != 0)
			return list.get(list.size() - 1).getMemberChatId();
		else
			return 0;
	}

	@Override
	public List<FriendPojo> getFriendsOnMessagePage(Integer memberId) {
		List<MemberFriendBean> memberFriendList = memberFriendDao.getAll();
		List<FriendPojo> friendPojoList = new ArrayList<FriendPojo>();
		
		for (MemberFriendBean bean : memberFriendList) {
			if (bean.getInviteMemberId().equals(memberId)) {
				FriendPojo pojo = new FriendPojo();
				pojo.setMemberId(bean.getReceiveMemberId());
				pojo.setMemberName(memberMainDao.getByMemberId(bean.getReceiveMemberId()).getMemberName());
				pojo.setMessageHash(bean.getMessageHash());
				pojo.setNotRead(getOneFriendNotReadQuantity(bean.getReceiveMemberId(), memberId));
				pojo.setMessageText(getOneFriendLastMessage(bean.getMessageHash()));
				pojo.setMemberChatId(getOneFriendLastMessageId(bean.getMessageHash()));
				friendPojoList.add(pojo);
			}
		}
		
		Collections.sort(friendPojoList, new Comparator<FriendPojo>() {
			public int compare(FriendPojo f1, FriendPojo f2){
				return f2.getMemberChatId().compareTo(f1.getMemberChatId());
			}
		});
		
		return friendPojoList;
	}
	
}
