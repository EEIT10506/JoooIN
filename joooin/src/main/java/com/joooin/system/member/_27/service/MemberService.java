package com.joooin.system.member._27.service;


import com.joooin.model.MemberMainBean;

public interface MemberService {
	public MemberMainBean getMemberMainBean(Integer memberId); 
	public void updateMemberMainBean(MemberMainBean memberMainBean);
	public String checkFriendStatus(Integer inviteMemberId, Integer receiveMemberId);
	public void friendProcess(Integer inviteMemberId, Integer receiveMemberId, String process);
}
