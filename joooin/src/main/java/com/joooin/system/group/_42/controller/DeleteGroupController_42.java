package com.joooin.system.group._42.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.joooin.model.GroupMainBean;
import com.joooin.model.GroupPostBean;
import com.joooin.model.GroupPostReplyBean;
import com.joooin.model.MemberMainBean;
import com.joooin.repository.GroupMemberDao;
import com.joooin.repository.GroupPostDao;
import com.joooin.repository.GroupPostReplyDao;
import com.joooin.system.group._22.pojo.Replyer;
import com.joooin.system.group._22.service.GroupService_22;
import com.joooin.system.group._42.service.GroupService_42;

@Controller
public class DeleteGroupController_42 {
	@Autowired
	GroupMemberDao groupMemberDao;

	@Autowired
	GroupService_42 service;

	@Autowired
	GroupService_22 service2;

	@Autowired
	ServletContext context;

	@Autowired
	GroupPostDao groupPostDao;
	
	@Autowired
	GroupPostReplyDao groupPostReplyDao;
	
	//刪除文章功能
	@RequestMapping(value = "/DeleteGroupPost", method = RequestMethod.POST)
	public String DeleteGroupPostartice( @RequestParam Integer memberId, @RequestParam Integer groupPostId,HttpSession session,Integer groupId) {
		
		
		if(memberId!=null) {
		GroupPostBean groupPostBean =service2.getPostByGroupPostId(groupPostId);
		
		
			
			groupPostBean.setIsDeleted(true);
			service.updateGroupPostIsDeleted(groupPostBean);
		}
		return "redirect:/group/" + groupId;
		
	}
	//回文刪除
//	@RequestMapping(value = "/DeleteGroupReplyPost", method = RequestMethod.POST)
//	public String DeleteGroupReplyPostartice( @RequestParam Integer memberId, @RequestParam Integer groupPostReplyId,HttpSession session,Integer groupId) {
//		
//		
//		if(memberId!=null) {
//			List<Replyer> replyers=service2.getReplyerByGroupPostId(groupPostReplyId);
//			for(Replyer replyer : replyers) {
//				replyer.setGroupPostReplyId(groupPostReplyId);
//				replyer.setIsDeleted(true);
//				
//				
//			}
//			service.updateGroupReplyPostIsDeleted();
			
			
			
			
//		}
//		return "redirect:/group/" + groupId;
//		
//	}
	
}