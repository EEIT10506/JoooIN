package com.joooin.system.group._42.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.joooin.model.GroupMainBean;
import com.joooin.model.GroupPostBean;
import com.joooin.model.GroupPostReplyBean;
import com.joooin.repository.GroupMemberDao;
import com.joooin.system.group._22.service.GroupService_22;
import com.joooin.system.group._42.service.GroupService_42;
import com.joooin.util.ImageUtils;

@Controller
public class PostReplyGroupController_42 {
	@Autowired
	GroupMemberDao groupMemberDao;
	
	@Autowired
	GroupService_42 service;
	
	@Autowired
	GroupService_22 service2;
	
	@Autowired
	ServletContext context;
	@RequestMapping(method = RequestMethod.GET, value = "/group/postReply")
	public String getNewReplyForm(Model model, HttpSession session) {
			// 未登入不可回文
				Integer memberId = (Integer) session.getAttribute("memberId");
				if (memberId == null) {
					return "not_login";
				}

			// 送出空白回覆表單
				GroupPostReplyBean groupPostReplyBean = new GroupPostReplyBean();
				model.addAttribute("groupPostReplyBean", groupPostReplyBean);
					
		return "group/group_article"; 
	}
	
	// 處理新增表單
		@RequestMapping(method = RequestMethod.POST, value = "/group/postReply/{groupId}")
		public String processNewReplyForm(@PathVariable("groupId") Integer groupId,
				 HttpSession session,String groupPostReplyContent) {
			
			
			
			return "group/group_article/"+groupId;
			
		}


}