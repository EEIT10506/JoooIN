package com.joooin.system.member._27.service.impl;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joooin.model.EventMainBean;
import com.joooin.model.MemberFriendBean;
import com.joooin.model.MemberMainBean;
import com.joooin.repository.EventMainDao;
import com.joooin.repository.MemberFriendDao;
import com.joooin.repository.MemberMainDao;
import com.joooin.system.member._27.pojo.FriendPojo;
import com.joooin.system.member._27.service.MemberService;
import com.joooin.util.ImageUtils;

@Service
@Transactional
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberMainDao memberMainDao;
	@Autowired
	MemberFriendDao memberFriendDao;
	@Autowired
	EventMainDao eventMainDao;
	
	@Override
	public MemberMainBean getMemberMainBean(Integer memberId) {
		return memberMainDao.getByMemberId(memberId);
	}
	
	@Override
	public String updateProfile(Integer memberId, MemberMainBean updateBean, ServletContext context) {
		MemberMainBean oldBean = memberMainDao.getByMemberId(memberId);
		oldBean.setMemberName(updateBean.getMemberName());
		oldBean.setBirthday(updateBean.getBirthday());
		oldBean.setCity(updateBean.getCity());
		oldBean.setPhone(updateBean.getPhone());
		
		Byte[] memberImage = null;
		if (!updateBean.getMultipartFile().isEmpty()) {
			memberImage = ImageUtils.multipartFileToByteArray(updateBean.getMultipartFile());
			oldBean.setMemberImage(memberImage);
		} 
		memberMainDao.update(oldBean);
		
		return oldBean.getMemberName();
	}

	@Override
	public void updatePassword(String password1, String password2, Integer memberId) {
		if (password1.equals(password2)) {
			MemberMainBean bean = memberMainDao.getByMemberId(memberId);
			bean.setPassword(password1);
			memberMainDao.update(bean);
		}
	}

	@Override
	public void updatePrivacy(Integer memberId, MemberMainBean updateBean) {
		MemberMainBean oldBean = memberMainDao.getByMemberId(memberId);
		oldBean.setGenderDisplay(updateBean.getGenderDisplay());
		oldBean.setBirthdayDisplay(updateBean.getBirthdayDisplay());
		oldBean.setCityDisplay(updateBean.getCityDisplay());
		oldBean.setEmailDisplay(updateBean.getEmailDisplay());
		oldBean.setPhoneDisplay(updateBean.getPhoneDisplay());
		memberMainDao.update(oldBean);
	}
	
	@Override
	public String checkFriendStatus(Integer inviteMemberId, Integer receiveMemberId) {
		List<MemberFriendBean> list = memberFriendDao.getListByMemberId(inviteMemberId);
		
		if (!list.isEmpty()) {
			for (MemberFriendBean bean : list) {
				if (bean.getReceiveMemberId().equals(receiveMemberId)) {
					if (bean.getIsFriend() == true)
						return "FRIEND";
					else if (bean.getIsFriend() == false && bean.getIsInviter() == true)
						return "REQUEST";
					else 
						return "RECEIVE";
				} 
			}
			return "NOT_FRIEND";
		} else {
			return "NOT_FRIEND";
		}
	}

	@Override
	public void friendProcess(Integer inviteMemberId, Integer receiveMemberId, String process) {
		List<MemberFriendBean> list = memberFriendDao.getAll();
		
		if (process.equals("request")) {
			Boolean isRequested = false;
			
			for (MemberFriendBean bean : list) {
				if ((bean.getInviteMemberId().equals(inviteMemberId) && bean.getReceiveMemberId().equals(receiveMemberId))) {
					isRequested = true;
					break;
				}
			}
			if (!isRequested) {
				memberFriendDao.save(new MemberFriendBean(inviteMemberId, receiveMemberId, false, true));
				memberFriendDao.save(new MemberFriendBean(receiveMemberId, inviteMemberId, false, false));
			}
		}
		
		if (process.equals("cancel") || process.equals("reject") || process.equals("delete")) {
			int breakPoint = 0;
			for (MemberFriendBean bean : list) {
				if ((bean.getInviteMemberId().equals(inviteMemberId) && bean.getReceiveMemberId().equals(receiveMemberId)) ||
					(bean.getInviteMemberId().equals(receiveMemberId) && bean.getReceiveMemberId().equals(inviteMemberId))) {
					memberFriendDao.deleteByMemberFriendId(bean.getMemberFriendId());
					breakPoint++;
					if (breakPoint == 2) break;
				}
			}
		}
		
		if (process.equals("agree")) {
			int breakPoint = 0;
			for (MemberFriendBean bean : list) {
				if ((bean.getInviteMemberId().equals(inviteMemberId) && bean.getReceiveMemberId().equals(receiveMemberId)) ||
					(bean.getInviteMemberId().equals(receiveMemberId) && bean.getReceiveMemberId().equals(inviteMemberId))) {
					bean.setIsFriend(true);
					memberFriendDao.update(bean);
					breakPoint++;
					if (breakPoint == 2) break;
				}
			}
		}
	}

	@Override
	public List<FriendPojo> getFriends(Integer memberId) {
		List<MemberFriendBean> memberFriendList = memberFriendDao.getAll();
		List<FriendPojo> friendPojoList = new ArrayList<FriendPojo>();
		
		for (MemberFriendBean bean : memberFriendList) {
			if (bean.getInviteMemberId().equals(memberId)) {
				FriendPojo pojo = new FriendPojo();
				pojo.setMemberId(bean.getReceiveMemberId());
				pojo.setMemberName(memberMainDao.getByMemberId(bean.getReceiveMemberId()).getMemberName());
				pojo.setIsFriend(bean.getIsFriend());
				pojo.setIsInviter(bean.getIsInviter());
				friendPojoList.add(pojo);
			}
		}
		return friendPojoList;
	}

	@Override
	public List<EventMainBean> getEvents(Integer memberId, String process)  {
		List<EventMainBean> eventMainList = eventMainDao.getAll();
		
		if (process.equals("my_event")) {
			List<EventMainBean> list = new ArrayList<EventMainBean>();
			for (EventMainBean bean : eventMainList) {
				if (bean.getEventInviterId().equals(memberId)) 
					list.add(bean);
			}
			return list;
		}
		return null;
	}
	

}
