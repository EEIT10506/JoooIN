package com.joooin.system.member._27.service.impl;


import java.util.List;
import javax.servlet.ServletContext;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.joooin.model.MemberFriendBean;
import com.joooin.model.MemberMainBean;
import com.joooin.repository.MemberFriendDao;
import com.joooin.repository.MemberMainDao;
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
	MemberService memberService;
	
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
			return null;
		} else {
			return "NOT_FRIEND";
		}
	}
	
	

	@Override
	public void friendProcess(Integer inviteMemberId, Integer receiveMemberId, String process) {
		List<MemberFriendBean> list = null;
		
		if (process.equals("request")) {
			memberFriendDao.save(new MemberFriendBean(inviteMemberId, receiveMemberId, false, true));
			memberFriendDao.save(new MemberFriendBean(receiveMemberId, inviteMemberId, false, false));
		}
		if (process.equals("cancel") || process.equals("reject") || process.equals("delete")) {
			list = memberFriendDao.getAll();
			
			for (MemberFriendBean bean : list) {
				if ((bean.getInviteMemberId().equals(inviteMemberId) && bean.getReceiveMemberId().equals(receiveMemberId)) ||
					(bean.getInviteMemberId().equals(receiveMemberId) && bean.getReceiveMemberId().equals(inviteMemberId))) 
					memberFriendDao.deleteByMemberFriendId(bean.getMemberFriendId());
			}
		}
		if (process.equals("agree")) {
			list = memberFriendDao.getAll();
			
			for (MemberFriendBean bean : list) {
				if ((bean.getInviteMemberId().equals(inviteMemberId) && bean.getReceiveMemberId().equals(receiveMemberId)) ||
					(bean.getInviteMemberId().equals(receiveMemberId) && bean.getReceiveMemberId().equals(inviteMemberId))) {
					bean.setIsFriend(true);
					memberFriendDao.update(bean);
				}
			}
		}
	}

}
