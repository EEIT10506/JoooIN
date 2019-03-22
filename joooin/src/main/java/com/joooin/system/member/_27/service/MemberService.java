package com.joooin.system.member._27.service;


import java.util.List;
import javax.servlet.ServletContext;
import com.joooin.model.EventMainBean;
import com.joooin.model.GroupMainBean;
import com.joooin.model.MemberMainBean;
import com.joooin.system.member._27.pojo.FriendPojo;

public interface MemberService {
	public MemberMainBean getMemberMainBean(Integer memberId);
	public String updateProfile(Integer memberId, MemberMainBean updateBean, ServletContext context);
	public void updatePassword(String password1, String password2, Integer memberId);
	public void updatePrivacy(Integer memberId, MemberMainBean updateBean);
	public String checkFriendStatus(Integer inviteMemberId, Integer receiveMemberId);
	public void friendProcess(Integer inviteMemberId, Integer receiveMemberId, String process);
	public void deleteEvent(Integer memberId, Integer eventId);
	public void cancelEvent(Integer memberId, Integer eventId);
	public void noLikeEvent(Integer memberId, Integer eventId);
	public void deleteGroup(Integer memberId, Integer groupId);
	public void cancelGroup(Integer memberId, Integer groupId);
	public List<FriendPojo> getFriendsOnFriendPage(Integer memberId);
	public List<EventMainBean> getEvents(Integer memberId, String process);
	public List<GroupMainBean> getGroups(Integer memberId, String process);
}
