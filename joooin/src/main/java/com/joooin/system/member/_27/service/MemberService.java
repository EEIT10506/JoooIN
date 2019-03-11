package com.joooin.system.member._27.service;

import com.joooin.model.MemberMainBean;

public interface MemberService {
	public MemberMainBean getMemberMainBean(Integer memberId); 
	public void updateMemberMainBean(MemberMainBean memberMainBean);
}
