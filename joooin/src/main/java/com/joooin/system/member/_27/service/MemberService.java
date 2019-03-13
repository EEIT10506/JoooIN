package com.joooin.system.member._27.service;


import javax.servlet.ServletContext;

import com.joooin.model.MemberMainBean;

public interface MemberService {
	public MemberMainBean getMemberMainBean(Integer memberId);
	public String updateProfile(Integer memberId, MemberMainBean updateBean, ServletContext context);
	public void updatePassword(String password1, String password2, Integer memberId);
	public void updatePrivacy(Integer memberId, MemberMainBean updateBean);
	public String checkFriendStatus(Integer inviteMemberId, Integer receiveMemberId);
	public void friendProcess(Integer inviteMemberId, Integer receiveMemberId, String process);
}
