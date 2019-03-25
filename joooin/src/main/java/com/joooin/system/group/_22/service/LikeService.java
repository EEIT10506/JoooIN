package com.joooin.system.group._22.service;

import java.util.List;

import com.joooin.system.group._22.pojo.Liker;

public interface LikeService {
	
	public void clickLike(Integer groupPostId, Integer memberId);
	public void cancelLike(Integer groupPostId, Integer memberId);
	public List<Liker> LikerInfo(Integer groupPostId);
	
}
