package com.joooin.system.member._27.service.impl;

import java.util.Iterator;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joooin.model.MemberFriendBean;
import com.joooin.model.MemberMainBean;
import com.joooin.repository.MemberFriendDao;
import com.joooin.repository.MemberMainDao;
import com.joooin.system.member._27.service.MemberService;

@Service
@Transactional
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberMainDao memberMainDao;
	@Autowired
	MemberFriendDao memberFriendDao;
	@Autowired
	MemberService memberService;
	
	@Override
	public MemberMainBean getMemberMainBean(Integer memberId) {
		return memberMainDao.getByMemberId(memberId);
	}

	@Override
	public void updateMemberMainBean(MemberMainBean memberMainBean) {
		memberMainDao.update(memberMainBean);
	}

	@Override
	public String checkFriendStatus(Integer inviteMemberId, Integer receiveMemberId) {
		List<MemberFriendBean> list = memberFriendDao.getListByMemberId(inviteMemberId);
		
		if (!list.isEmpty()) {
			for (MemberFriendBean bean : list) {
				if (bean.getReceiveMemberId().equals(receiveMemberId)) {
					if (bean.getIsFriend() == true)
						return "FRIEND";
					else if (bean.getIsFriend() == false || bean.getIsInviter() == true)
						return "REQUEST";
					else 
						return "RECEIVE";
				} 
			}
			return null;
		} else {
			return "NOT_FRIEND";
		}
	}

	@Override
	public void friendProcess(Integer inviteMemberId, Integer receiveMemberId, String process) {
		if (process.equals("request")) {
			memberFriendDao.save(new MemberFriendBean(inviteMemberId, receiveMemberId, false, true));
			memberFriendDao.save(new MemberFriendBean(receiveMemberId, inviteMemberId, false, false));
		}
		
	}
	
}
