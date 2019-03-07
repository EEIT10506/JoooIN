package com.joooin.repository;

import java.util.List;
import com.joooin.model.MemberMainBean;

public interface MemberMainDao {
	public MemberMainBean getByMemberId(Integer memberId);
	public List<MemberMainBean> getAll();
	public Integer save(MemberMainBean memberMainBean);
	public void update(MemberMainBean memberMainBean);
	public void deleteByMemberId(Integer memberId);
	public MemberMainBean checkIDPassword(String email, String password);
}
