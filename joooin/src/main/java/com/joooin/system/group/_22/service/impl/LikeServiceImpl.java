package com.joooin.system.group._22.service.impl;

import java.util.LinkedList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joooin.model.GroupPostLikeBean;
import com.joooin.repository.GroupPostLikeDao;
import com.joooin.repository.MemberMainDao;
import com.joooin.system.group._22.pojo.Liker;
import com.joooin.system.group._22.pojo.Replyer;
import com.joooin.system.group._22.service.LikeService;


@Transactional
@Service
public class LikeServiceImpl implements LikeService {

	@Autowired
	GroupPostLikeDao likeDao;
	
	@Autowired
	MemberMainDao memMainDao;
	
	@Override
	public void clickLike(Integer groupPostId, Integer memberId) {
		GroupPostLikeBean like = new GroupPostLikeBean();
		like.setGroupPostId(groupPostId);
		like.setMemberId(memberId);
		likeDao.save(like);
	}

	@Override
	public void cancelLike(Integer groupPostId, Integer memberId) {
		List<GroupPostLikeBean> likeList = likeDao.getAll();
		for(GroupPostLikeBean like : likeList) {
			if(like.getGroupPostId().equals(groupPostId) && like.getMemberId().equals(memberId)) {
				likeDao.deleteByGroupPostLikeId(like.getGroupPostLikeId());
				break;
			}
		}
	}

	@Override
	public List<Liker> LikerInfo(Integer groupPostId) {
		LinkedList<Liker> likers = new LinkedList<Liker>();
		for(GroupPostLikeBean like : likeDao.getAll()) {
			if(like.getGroupPostId().equals(groupPostId)) {
				Liker liker = new Liker();
				liker.setGroupPostLikeId(like.getGroupPostLikeId());
				liker.setGroupPostId(groupPostId);
				liker.setMemberId(like.getMemberId());
				String memberName = memMainDao.getByMemberId(like.getMemberId()).getMemberName();
				liker.setMemberName(memberName);
				
				likers.add(liker);
			}
		}
		return likers;
	}

}
