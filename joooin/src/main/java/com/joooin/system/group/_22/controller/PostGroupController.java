package com.joooin.system.group._22.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.joooin.model.MemberMainBean;
import com.joooin.system.group._22.service.GroupService_22;
import com.joooin.system.member._27.service.MemberService;
import com.joooin.util.ImageUtils;

@Controller
public class PostGroupController {

	@Autowired
	GroupService_22 groupService;

	@Autowired
	ServletContext context;

	@Autowired
	MemberService memService;

	// 時間格式
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd ahh:mm:ss");

	// 進入社團發文頁面
	@RequestMapping(method = RequestMethod.GET, value = "/group/addpost/{groupId}")
	public String mainPagePost(Model model, HttpSession session, @PathVariable Integer groupId) {

		// 未登入不可創社團
		Integer memberId = (Integer) session.getAttribute("memberId");
		if (memberId == null) {
			return "not_login";
		}
		
		//
//			待寫，非社團成員不可PO
		//
		GroupMainBean groupMain = groupService.getByGroupId(groupId);
		model.addAttribute("groupMain", groupMain); // pass group資訊

		MemberMainBean member = memService.getMemberMainBean(memberId);
		model.addAttribute("member", member); // pass member資訊

		// 送出空白發文表單
		GroupPostBean groupPost = new GroupPostBean();
		model.addAttribute("groupPostBean", groupPost);

		return "group/group_post";
	}

	// 處理新增發文
	@RequestMapping(method = RequestMethod.POST, value = "/group/addpost/{groupId}")
	public String processNewGroupForm(@ModelAttribute("groupPostBean") GroupPostBean groupPostBean,
			HttpSession session) {

		Integer groupId = groupPostBean.getGroupId();
		
		// 回復用照片測試
		Byte[] groupImage = null;
		if (!groupPostBean.getMultipartFile().isEmpty()) {
			groupImage = ImageUtils.multipartFileToByteArray(groupPostBean.getMultipartFile());
			groupPostBean.setGroupPostContent(groupImage);
		}

			// 沒有like
			groupPostBean.setGroupPostLike(0);

			// 預設發文時間為當下
			groupPostBean.setGroupPostDate((sdf.format(new Date()).toString()));

			// 預設顯示文章
			groupPostBean.setIsDeleted(false);

			// 文章建立
			groupService.createPost(groupPostBean);

			return "redirect:/group/" + groupId;
	}
}
