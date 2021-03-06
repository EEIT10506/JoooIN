package com.joooin.system.group._22.service;

import java.util.List;

import com.joooin.model.GroupMainBean;
import com.joooin.model.GroupMemberBean;
import com.joooin.model.GroupPostBean;
import com.joooin.model.GroupPostReplyBean;
import com.joooin.model.MemberMainBean;
import com.joooin.system.group._22.pojo.MemPostInfo;
import com.joooin.system.group._22.pojo.Poster;
import com.joooin.system.group._22.pojo.Replyer;

public interface GroupService_22 {
	public Integer createGroup(GroupMainBean groupMainBean); // new group then set and save
	
	public GroupMainBean getByGroupId(Integer groupId); //以id找group
	
	public void leaderAddToGroup(Integer groupId, Integer memberId); // 配合創社團使用，將團長加入社團
	
	public String leaderOfGroup(Integer groupId); // 以id找laeder
	
	//該member是否在該社團 :	IN，PROCESS，NOT_IN
	public String statusApplyGroup(Integer groupId, Integer memberId); 
	
	public void memberAddToGroupApply(Integer groupId, Integer memberId); // 將會員加入社團申請
	
	public List<MemberMainBean> getGroupApplyMembers(Integer groupId); // 取出該社團申請入團的會員資料
	
	public List<GroupMemberBean> getGroupApplyList(Integer groupId); // 取出該社團確認及未確認的清單
	
	public List<GroupMemberBean> getProcessGroupApplyList(Integer groupId); // 取出該社團申請入團的清單
	
	// 根據approve，reject 改變清單中的會員狀態，許可的話回傳新增的會員ID
	public Integer processApplyList(Integer groupId, Integer memberId, String decide);
	
	public List<MemberMainBean> getMembersInGroup(Integer groupId); // 取得該社團內成員
	
	public List<MemPostInfo> getMemInfoInGroup(Integer groupId); // 取得該社團內成員活動資訊
	
	public void removeGroupMember(Integer groupId, Integer memberId);
	
/////////////////////////////////////////////////////////////////////////////////////////////////////	
	
	public Integer createPost(GroupPostBean groupPostBean); // 發布文章
	
	public List<Poster> getPostersByGroupId(Integer groupId); // 以groupId找文章列表
	
	public Poster getPosterByGroupPostId(Integer groupPostId); // 以POJO傳遞單篇文章資訊

	public GroupPostBean getPostByGroupPostId(Integer groupPostId); // 以POJO傳遞單篇文章資訊
	
	public Integer createReply(GroupPostReplyBean groupPostReplyBean); // 發布回文
	
	public List<GroupPostReplyBean> getReplyByPostId(Integer groupPostId); //以groupPostId 取得所有回文 並排序
	
	public List<Replyer> getReplyerByGroupPostId(Integer groupPostId); // 以POJO傳遞多篇回文資訊
	
	public boolean getPermission(Integer groupId, Integer memberId); // 決定使用者能不能回文
	
	public Integer getPostAccount(Integer groupId, Integer memberId); // 找出該會員在該社團的發文

	public Integer getReplyAccount(Integer groupId, Integer memberId); // 找出該會員在該社團的回文
	
	public Integer getPhotoCount(Integer groupId);
}
