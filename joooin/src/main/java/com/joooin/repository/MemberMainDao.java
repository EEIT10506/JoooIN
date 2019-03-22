package com.joooin.repository;

import java.util.List;
import com.joooin.model.MemberMainBean;
import com.joooin.system.admin._03.model.AllMemberQuantityBean;

public interface MemberMainDao {
	public MemberMainBean getByMemberId(Integer memberId);
	public List<MemberMainBean> getAll();
	public Integer save(MemberMainBean memberMainBean);
	public void update(MemberMainBean memberMainBean);
	public void deleteByMemberId(Integer memberId);
	public MemberMainBean checkIDPassword(String email, String password);
	public MemberMainBean checkEmail(String email);
	public int activeUser(String certificationHash);
	public List<AllMemberQuantityBean> getAllMemberQuantity();
}
