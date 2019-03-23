package com.joooin.system.group._22.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joooin.system.group._22.pojo.Liker;
import com.joooin.system.group._22.service.GroupService_22;
import com.joooin.system.group._22.service.LikeService;

@Controller
public class LikeGroupController {

	@Autowired
	GroupService_22 groupService;
	
	@Autowired
	LikeService likeService;

	@RequestMapping(method = RequestMethod.POST, value ="/groupPost/like/{groupPostId}")
	public String like(@PathVariable Integer groupPostId, HttpSession session) {
		// 未登入不可like
		Integer memberId = (Integer) session.getAttribute("memberId");
		if (memberId == null) {
			return "not_login";
		}
		
		likeService.clickLike(groupPostId, memberId);

		return "redirect:/group/return/like/" + groupPostId;

	}

	@RequestMapping(method = RequestMethod.POST, value ="/groupPost/dislike/{groupPostId}")
	public String dislike(@PathVariable Integer groupPostId, HttpSession session) {
		//應該不會有未登入可以按這邊
		Integer memberId = (Integer) session.getAttribute("memberId");
		likeService.cancelLike(groupPostId, memberId);
		return "redirect:/group/return/like/" + groupPostId;
	}
	
	@RequestMapping(method = RequestMethod.GET, value ="/group/return/like/{groupPostId}")
	@ResponseBody
	public List<Liker>getLikers(@PathVariable Integer groupPostId) {
		List<Liker> likers = likeService.LikerInfo(groupPostId);
		
		return likers;
	}
	
	
	
	
}
