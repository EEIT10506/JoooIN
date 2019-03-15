package com.joooin.system.group._22.controller;

import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.joooin.model.GroupMainBean;
import com.joooin.system.group._22.service.GroupService_22;
import com.joooin.util.ImageUtils;

@Controller
public class CreateGroupController {
	@Autowired
	GroupService_22 service;

	@Autowired
	ServletContext context;

	// 送出空白社團表單
	@RequestMapping(method = RequestMethod.GET, value = "/groups/create")
	public String getNewGroupForm(Model model, HttpSession session) {

		// 未登入不可創社團
		Integer memberId = (Integer) session.getAttribute("memberId");
		if (memberId == null) {
			return "not_login";
		}

		// 送出空白社團表單
		GroupMainBean groupMainBean = new GroupMainBean();
		model.addAttribute("groupMainBean", groupMainBean);
		return "group/group_create";
	}

	// 處理新增表單
	@RequestMapping(method = RequestMethod.POST, value = "/groups/create")
	public String processNewGroupForm(@ModelAttribute("groupMainBean") GroupMainBean groupMainBean,
			BindingResult bResult, HttpSession session) {

		System.out.println(groupMainBean.getGroupType());

		// bResult待加入白名單功能

		// 若未提供圖片，使用預設圖片
		Byte[] groupImage = null;
		if (!groupMainBean.getMultipartFile().isEmpty()) {
			groupImage = ImageUtils.multipartFileToByteArray(groupMainBean.getMultipartFile());
			groupMainBean.setGroupImage(groupImage);
		
		// 有空再精簡化
		} else {
			// 根據type配置預設圖片
			if (groupMainBean.getGroupType().equals("sport")) {
				groupMainBean.setGroupImage(ImageUtils.localImageToByteArray("cover_sport.jpg", context));
			}
			if (groupMainBean.getGroupType().equals("other")) {
				groupMainBean.setGroupImage(ImageUtils.localImageToByteArray("cover_other.jpg", context));
			}
			if (groupMainBean.getGroupType().equals("food")) {
				groupMainBean.setGroupImage(ImageUtils.localImageToByteArray("cover_food.jpg", context));
			}
			if (groupMainBean.getGroupType().equals("entertainment")) {
				groupMainBean.setGroupImage(ImageUtils.localImageToByteArray("cover_entertainment.jpg", context));
			}
		}

		// 取得並設定當前使用者memId
		Integer memId = (Integer) session.getAttribute("memberId");
		groupMainBean.setGroupLeaderId(memId);

		// 1 : 開團者
		groupMainBean.setGroupCurrentMembers(1);

		// 預設開團時間為當下
		groupMainBean.setGroupCreateDate(LocalDateTime.now().toString());

		// 創社團
		Integer groupId = service.createGroup(groupMainBean);

		service.leaderAddToGroup(groupId, memId);

		return "redirect:/groups";
	}

	// 處理加入或進入{groupId}社團
	@RequestMapping(method = RequestMethod.POST, value = "/group/addgroup/{groupId}")
	public String processAddGroup(@PathVariable Integer groupId, HttpSession session, Model model) {
		Integer memId = (Integer) session.getAttribute("memberId");

		// 未登入不可加入社團
		if (memId == null) {
			return "not_login";
		}

		if (service.isInGroup(groupId, memId)) {
			return "redirect:/group/" + groupId; // 已經在社團中了，前端按鈕顯示為進入社團
		} else {
			service.memberAddToGroup(groupId, memId);
			model.addAttribute("status", "申請成功，待批准");
			return "已申請成功";
		}
	}

}
