package com.joooin.system.group._22.service.impl;

import java.util.LinkedList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joooin.model.GroupMainBean;
import com.joooin.model.GroupMemberBean;
import com.joooin.model.MemberMainBean;
import com.joooin.repository.GroupMainDao;
import com.joooin.repository.GroupMemberDao;
import com.joooin.repository.MemberMainDao;
import com.joooin.system.group._22.service.GroupService_22;


@Service
public class GroupServiceImpl_22 implements GroupService_22 {

	@Autowired
	SessionFactory factory;
	
	@Autowired
	GroupMainDao groupMainDao;
	
	@Autowired
	MemberMainDao memMainDao;
	
	@Autowired
	GroupMemberDao groupMemberDao;
	
	@Override
	public GroupMainBean getByGroupId(Integer groupId) {
		return groupMainDao.getByGroupId(groupId);
	}

	@Override
	public Integer createGroup(GroupMainBean groupMainBean) {
		return groupMainDao.save(groupMainBean);
	}

	@Override
	public String leaderOfGroup(Integer groupId) {
		Integer leaderId = groupMainDao.getByGroupId(groupId).getGroupLeaderId();
		String leaderName = memMainDao.getByMemberId(leaderId).getMemberName();
		return leaderName;
	}

	
	@Override
	public String statusApplyGroup(Integer groupId, Integer memberId) {
		List<GroupMemberBean> groupMemberList = groupMemberDao.getAll();
		
		for(GroupMemberBean singleGroupMember : groupMemberList) {
			if(groupId.equals(singleGroupMember.getGroupId()) 
					&& memberId.equals(singleGroupMember.getMemberId())) {  //社團與會員重複，該社團申請中有此人
				if(singleGroupMember.getIsAgreed()) {
					return "IN";
				}
				else {
					return "PROCESS";
				}
			}
		}
		return "NOT_IN";
	}
	
	@Override
	public void memberAddToGroupApply(Integer groupId, Integer memberId) {
		//剛加入預設為待確認false
		GroupMemberBean groupMemberBean = new GroupMemberBean(groupId, memberId, false);
		groupMemberDao.save(groupMemberBean);
	}

	@Override
	public void leaderAddToGroup(Integer groupId, Integer memberId) {
		//leader 加入預設為確認true
		GroupMemberBean groupMemberBean = new GroupMemberBean(groupId, memberId, true);
		groupMemberDao.save(groupMemberBean);
	}

	//找出申請此社團的會員
	@Override
	public List<MemberMainBean> getGroupApplyMembers(Integer groupId) {
		
		// 放待申請的bean
		List<MemberMainBean> GroupApplyList = new LinkedList<MemberMainBean>(); 
		
		List<GroupMemberBean> allGroupMember = groupMemberDao.getAll();
		
		
		for(GroupMemberBean gmBean : allGroupMember) {
			if(gmBean.getGroupId().equals(groupId) && (! gmBean.getIsAgreed())) {
				
				// 該社團 且狀態是 未允許 取出 memberBean
				MemberMainBean member = 
						memMainDao.getByMemberId(gmBean.getMemberId());
				GroupApplyList.add(member);
			}
		}
		return GroupApplyList;
	}
	
	@Override
	public List<GroupMemberBean> getGroupApplyList(Integer groupId) {
		List<GroupMemberBean> groupApplyList = new LinkedList<GroupMemberBean>();
		List<GroupMemberBean> allGroupMember = groupMemberDao.getAll();
		
		for(GroupMemberBean gmBean : allGroupMember ) {
			//
			if(gmBean.getGroupId().equals(groupId)) 
			//
				{
				groupApplyList.add(gmBean);
			}
		}
		return groupApplyList;
	}
	
	@Override
	public List<GroupMemberBean> getProcessGroupApplyList(Integer groupId) {
		List<GroupMemberBean> groupApplyList = new LinkedList<GroupMemberBean>();
		List<GroupMemberBean> allGroupMember = groupMemberDao.getAll();
		
		for(GroupMemberBean gmBean : allGroupMember ) {
			//
			if(gmBean.getGroupId().equals(groupId)  && (! gmBean.getIsAgreed())) 
				//
			{
				groupApplyList.add(gmBean);
			}
		}
		return groupApplyList;
	}

	@Override
	public Integer processApplyList(Integer groupId, Integer memberId, String decide) {
		List<GroupMemberBean> groupApplyList = getGroupApplyList(groupId);
		GroupMainBean groupMain = groupMainDao.getByGroupId(groupId);
		
		for(GroupMemberBean gmBean : groupApplyList) {
			if(gmBean.getMemberId().equals(memberId) && decide.equals("approve")) {
				gmBean.setIsAgreed(true);
				groupMain.setGroupCurrentMembers(groupMain.getGroupCurrentMembers() + 1);
				return gmBean.getMemberId();
			}
			else if(gmBean.getMemberId().equals(memberId) && decide.equals("reject")) {
				groupMemberDao.deleteByGroupMemberId(gmBean.getGroupMemberId());
				return null;
			}
		}
		return null;
	}

	@Override
	public List<MemberMainBean> getMembersInGroup(Integer groupId) {
		List<MemberMainBean> memberInGroupList = new LinkedList<MemberMainBean>();
		
		List<GroupMemberBean> groupApplyList = getGroupApplyList(groupId);
		for(GroupMemberBean gmBean : groupApplyList) {
			if(gmBean.getIsAgreed()){
			MemberMainBean member = memMainDao.getByMemberId(gmBean.getMemberId());
			memberInGroupList.add(member);
			}
		}
		return memberInGroupList;
	}
}
















