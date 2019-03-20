package com.joooin.system.member._27.service.impl;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

	
	@Override
	public MemberMainBean getFriendMemberMainBean(Integer memberId, String messageHash) {
		List<MemberFriendBean> list = memberFriendDao.getAll();
		Integer friendId = null;
		
		for (MemberFriendBean bean : list) {
			if (bean.getInviteMemberId().equals(memberId) && bean.getMessageHash().equals(messageHash)) {
				friendId = bean.getReceiveMemberId();
				System.out.println(bean.getReceiveMemberId());
			}
		}
		return memberService.getMemberMainBean(friendId);
	}

	@Override
	public void saveTextMessage(Integer sendMemberId, Integer receiveMemberId, String messageHash, String text) {
		MemberChatBean bean = new MemberChatBean();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
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
	public List<MemberChatBean> getMessage(String messageHash) {
		List<MemberChatBean> allList = memberChatDao.getAll();
		List<MemberChatBean> myList = new ArrayList<MemberChatBean>();
		
		for (MemberChatBean bean : allList) {
			if (bean.getMessageHash().equals(messageHash)) {
				myList.add(bean);
			}
		}
		return myList;
	}
	
	
	
	

}
