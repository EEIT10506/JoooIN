package com.joooin.system.group._22.service.impl;

import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joooin.model.GroupMainBean;
import com.joooin.model.GroupMemberBean;
import com.joooin.model.GroupPostBean;
import com.joooin.model.GroupPostReplyBean;
import com.joooin.model.MemberMainBean;
import com.joooin.repository.GroupMainDao;
import com.joooin.repository.GroupMemberDao;
import com.joooin.repository.GroupPostDao;
import com.joooin.repository.GroupPostReplyDao;
import com.joooin.repository.MemberMainDao;
import com.joooin.system.group._22.pojo.Poster;
import com.joooin.system.group._22.pojo.Replyer;
import com.joooin.system.group._22.service.GroupService_22;

@Transactional
@Service
public class GroupServiceImpl_22 implements GroupService_22 {

	@Autowired
	SessionFactory factory;

	@Autowired
	GroupMainDao groupMainDao;

	@Autowired
	GroupMemberDao groupMemberDao;

	@Autowired
	GroupPostDao groupPostDao;
	
	@Autowired
	GroupPostReplyDao groupReplyDao;

	@Autowired
	MemberMainDao memMainDao;

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

		for (GroupMemberBean singleGroupMember : groupMemberList) {
			if (groupId.equals(singleGroupMember.getGroupId()) && memberId.equals(singleGroupMember.getMemberId())) { // 社團與會員重複，該社團申請中有此人
				if (singleGroupMember.getIsAgreed()) {
					return "IN";
				} else {
					return "PROCESS";
				}
			}
		}
		return "NOT_IN";
	}

	@Override
	public void memberAddToGroupApply(Integer groupId, Integer memberId) {
		// 剛加入預設為待確認false
		GroupMemberBean groupMemberBean = new GroupMemberBean(groupId, memberId, false);
		groupMemberDao.save(groupMemberBean);
	}

	@Override
	public void leaderAddToGroup(Integer groupId, Integer memberId) {
		// leader 加入預設為確認true
		GroupMemberBean groupMemberBean = new GroupMemberBean(groupId, memberId, true);
		groupMemberDao.save(groupMemberBean);
	}

	// 找出申請此社團的會員
	@Override
	public List<MemberMainBean> getGroupApplyMembers(Integer groupId) {

		// 放待申請的bean
		List<MemberMainBean> GroupApplyList = new LinkedList<MemberMainBean>();

		List<GroupMemberBean> allGroupMember = groupMemberDao.getAll();

		for (GroupMemberBean gmBean : allGroupMember) {
			if (gmBean.getGroupId().equals(groupId) && (!gmBean.getIsAgreed())) {

				// 該社團 且狀態是 未允許 取出 memberBean
				MemberMainBean member = memMainDao.getByMemberId(gmBean.getMemberId());
				GroupApplyList.add(member);
			}
		}
		return GroupApplyList;
	}

	@Override
	public List<GroupMemberBean> getGroupApplyList(Integer groupId) {
		List<GroupMemberBean> groupApplyList = new LinkedList<GroupMemberBean>();
		List<GroupMemberBean> allGroupMember = groupMemberDao.getAll();

		for (GroupMemberBean gmBean : allGroupMember) {
			//
			if (gmBean.getGroupId().equals(groupId))
			//
			{
				groupApplyList.add(gmBean);
			}
		}
		return groupApplyList;
	}

	@Override
	// 使用小心，這是複製人
	public List<GroupMemberBean> getProcessGroupApplyList(Integer groupId) {
		List<GroupMemberBean> groupApplyList = new LinkedList<GroupMemberBean>();
		List<GroupMemberBean> allGroupMember = groupMainDao.getByGroupId(groupId).getGroupMemberList();
//		List<GroupMemberBean> allGroupMember = groupMemberDao.getAll();

		for (GroupMemberBean gmBean : allGroupMember) {
			//
			if (!gmBean.getIsAgreed())
			//
			{
				groupApplyList.add(gmBean);
			}
		}
		return groupApplyList;
	}

	@Override
	public Integer processApplyList(Integer groupId, Integer memberId, String decide) {
		GroupMainBean groupMain = groupMainDao.getByGroupId(groupId);

		// version.1
		for (GroupMemberBean realGMBean : groupMemberDao.getAll()) {
			if (realGMBean.getGroupId().equals(groupId) && realGMBean.getMemberId().equals(memberId)
					&& decide.equals("approve")) {

				realGMBean.setIsAgreed(true);
				groupMemberDao.update(realGMBean);

				groupMain.setGroupCurrentMembers(groupMain.getGroupCurrentMembers() + 1);
				groupMainDao.update(groupMain);

				return realGMBean.getMemberId();
			} else if (realGMBean.getGroupId().equals(groupId) && realGMBean.getMemberId().equals(memberId)
					&& decide.equals("reject")) {
				groupMemberDao.deleteByGroupMemberId(realGMBean.getGroupMemberId());
				break;
			}

		}
		return null;

//
//		for (GroupMemberBean member : gmList) {
//			if(member.getMemberId().equals(memberId) && decide.equals("approve")) {
//				member.setIsAgreed(true);
//				groupMain.setGroupCurrentMembers(groupMain.getGroupCurrentMembers() + 1 );
//			}
//			else if(member.getMemberId().equals(memberId) && decide.equals("reject")){
//				gmList.remove(member);
//			}
//		}
//		groupMain.setGroupMemberList(gmList);
//		groupMainDao.update(groupMain);

//		List<GroupMemberBean> groupApplyList = getProcessGroupApplyList(groupId);
//		for(GroupMemberBean gmBean : groupApplyList) {
//			if(gmBean.getMemberId().equals(memberId) && decide.equals("approve")) {
//				
//				gmBean.setIsAgreed(true);
//				groupMemberDao.update(gmBean);
//				
//				groupMain.setGroupCurrentMembers(groupMain.getGroupCurrentMembers() + 1);
//				groupMainDao.update(groupMain);
//
//				
//				return gmBean.getMemberId();
//			}
//			else if(gmBean.getMemberId().equals(memberId) && decide.equals("reject")) {
//				try {
//					groupApplyList.remove(gmBean);
//				} catch (Exception e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//				try {
//					groupMain.getGroupMemberList().remove(gmBean);
//				} catch (Exception e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//				
//				try {
//					groupMemberDao.deleteByGroupMemberId(gmBean.getGroupMemberId());
//				} catch (Exception e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//				
//				try {
//					groupMainDao.update(groupMain);
//				} catch (Exception e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//				
////				for(GroupMemberBean realGMBean : groupMemberDao.getAll()) {
////					if(gmBean.equals(realGMBean)) {
////						groupApplyList.remove(gmBean);
////						groupMemberDao.deleteByGroupMemberId(realGMBean.getGroupMemberId());
////						break;
////					}
////				}
//			}
//			else {
//				System.out.println("服務失敗");
//				return null;
//			}

//			 else if(gmBean.getMemberId().equals(memberId) && decide.equals("reject")) {
//				System.out.println("gmId:" + gmBean.getGroupMemberId());
//				List<GroupMemberBean> allGM = groupMemberDao.getAll();
//	//			for(GroupMemberBean gm : groupMemberDao.getAll()) {
//	//				if(gm.getMemberId().equals(memberId) && gm.getGroupId().equals(groupId) && decide.equals("reject")) {
//	//					groupMemberDao.deleteByGroupMemberId(gm.getGroupMemberId());
//	//					break;
//	//				}
//	//			}

//				System.out.println("刪除的GroupMemberBean" + gmBean.getGroupId());
//				groupMemberDao.deleteByGroupMemberId(gmBean.getGroupMemberId());
//				System.out.println("刪除成功");
//				return null;
//			}
//		}
//		return null;
//		
	}

	@Override
	// 新版2019320
	public List<MemberMainBean> getMembersInGroup(Integer groupId) {
		List<MemberMainBean> memberInGroupList = new LinkedList<MemberMainBean>();
		List<GroupMemberBean> allGroupMember = groupMainDao.getByGroupId(groupId).getGroupMemberList();

		for (GroupMemberBean gmBean : allGroupMember) {
			if (gmBean.getIsAgreed()) {
				MemberMainBean member = memMainDao.getByMemberId(gmBean.getMemberId());
				memberInGroupList.add(member);
			}
		}

		return memberInGroupList;
	}

	@Override
	public Integer createPost(GroupPostBean groupPostBean) {
		return groupPostDao.save(groupPostBean);
	}

	@Override
	public List<Poster> getPostersByGroupId (Integer groupId) {
		List<GroupPostBean> groupPosts = groupPostDao.getAll();
		List<Poster> postersByGroupId = new LinkedList<Poster>();
		for(GroupPostBean post : groupPosts) {
			if(post.getGroupId().equals(groupId)) {
				Poster poster = new Poster();
				poster.setGroupId(groupId);
				poster.setGroupPostImage(post.getGroupPostImage());
				poster.setGroupPostDate(post.getGroupPostDate());
				poster.setGroupPostId(post.getGroupPostId());
				poster.setGroupPostLike(post.getGroupPostLike());
				poster.setGroupPostTitle(post.getGroupPostTitle());
				poster.setIsDeleted(post.getIsDeleted());
				poster.setMemberId(post.getMemberId());
				String memberName = memMainDao.getByMemberId(post.getMemberId()).getMemberName();
				poster.setMemberName(memberName);
				
				postersByGroupId.add(poster);
			}
		}
		return postersByGroupId;
	}


	@Override
	// 回傳單篇文章資訊
	public Poster getPosterByGroupPostId(Integer groupPostId) { 
		GroupPostBean post = groupPostDao.getByGroupPostId(groupPostId);
		Poster poster = new Poster();
		
		poster.setGroupId(post.getGroupId());
		poster.setGroupPostText(post.getGroupPostText());
		poster.setGroupPostImage(post.getGroupPostImage());
		poster.setGroupPostDate(post.getGroupPostDate());
		poster.setGroupPostId(post.getGroupPostId());
		poster.setGroupPostLike(post.getGroupPostLike());
		poster.setGroupPostTitle(post.getGroupPostTitle());
		poster.setIsDeleted(post.getIsDeleted());
		poster.setMemberId(post.getMemberId());
		String memberName = memMainDao.getByMemberId(post.getMemberId()).getMemberName();
		poster.setMemberName(memberName);
		
		return poster;
	}

	@Override
	public Integer createReply(GroupPostReplyBean groupReplyBean) {
		groupReplyDao.save(groupReplyBean);
		return null;
	}

	@Override
	public List<GroupPostReplyBean> getReplyByPostId(Integer groupPostId) {
		List<GroupPostReplyBean> allReply = groupReplyDao.getAll();
		
		List<GroupPostReplyBean> postReply = new LinkedList<GroupPostReplyBean>();
		
		for(GroupPostReplyBean reply : allReply) {
			
			// 尚未判斷delete
			if(reply.getGroupPostId().equals(groupPostId)) {
				postReply.add(reply);
			}
		}
		// 依照日期 sort
		Collections.sort(postReply, new Comparator<GroupPostReplyBean>() {
			public int compare(GroupPostReplyBean replyA, GroupPostReplyBean replyB) {
				return replyA.getGroupPostReplyDate().compareTo(replyB.getGroupPostReplyDate());
			}
		});
//		List<GroupPostReplyBean> postReplyByDate = new LinkedList<GroupPostReplyBean>();
//		for(GroupPostReplyBean poReply : postReply) {
//			postReplyByDate.add(poReply);
//		}
		return postReply;
	}

	@Override
	public List<Replyer> getReplyerByGroupPostId(Integer groupPostId) {
		LinkedList<Replyer> replyers = new LinkedList<Replyer>();
		List<GroupPostReplyBean> groupReply = getReplyByPostId(groupPostId);
		for(GroupPostReplyBean reply : groupReply) {
			if(! reply.getIsDeleted()) {
				Replyer replyer = new Replyer();
				replyer.setGroupPostReplyId(reply.getGroupPostReplyId());
				replyer.setGroupId(reply.getGroupId());
				replyer.setGroupPostId(reply.getGroupPostId());
				replyer.setMemberId(reply.getMemberId());
				replyer.setGroupPostReplyContent(reply.getGroupPostReplyContent());
				replyer.setGroupPostReplyDate(reply.getGroupPostReplyDate());
				replyer.setIsDeleted(reply.getIsDeleted());
				String memberName = memMainDao.getByMemberId(reply.getMemberId()).getMemberName();
				replyer.setMemberName(memberName);
				replyers.add(replyer);
			}
		}
		
		return replyers;
	}
	
	
	
	
	
	
	
	
	
}
