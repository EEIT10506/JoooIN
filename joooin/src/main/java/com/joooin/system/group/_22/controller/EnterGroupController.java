package com.joooin.system.group._22.controller;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.joooin.model.GroupMainBean;
import com.joooin.model.GroupMemberBean;
import com.joooin.model.MemberMainBean;
import com.joooin.system.group._22.service.GroupService_22;
import com.joooin.system.member._27.service.MemberService;
import com.joooin.util.ImageUtils;

@Controller
public class EnterGroupController {

	@Autowired
	MemberService memberService;
	
	@Autowired
	GroupService_22 groupService;

	@Autowired
	ServletContext context;

	// 依照groupId個別社團主頁連結
	@RequestMapping(method = RequestMethod.GET, value = "/group/{groupId}")
	public String groupMainPage(Model model, @PathVariable Integer groupId) {
		LinkedList<MemberMainBean> applyMember = new LinkedList<>();
		GroupMainBean groupMain = groupService.getByGroupId(groupId);
		
		for(GroupMemberBean member : groupService.getProcessGroupApplyList(groupId)) {
			MemberMainBean memberMain = memberService.getMemberMainBean(member.getMemberId());
			applyMember.add(memberMain);
		}
		
		model.addAttribute("groupMain", groupMain);
		model.addAttribute("applyMemberMain", applyMember);
		
		return "group/group";
	}

	// 進入社團關於介紹
	@RequestMapping(method = RequestMethod.GET, value = "/group/about/{groupId}")
	public String mainPageAbout(Model model, @PathVariable Integer groupId) {

		GroupMainBean groupMain = groupService.getByGroupId(groupId);
		String leader = groupService.leaderOfGroup(groupId);
		model.addAttribute("groupMain", groupMain);
		model.addAttribute("leader", leader);

		return "group/group_about";
	}

	// 進入社團成員
	@RequestMapping(method = RequestMethod.GET, value = "/group/members/{groupId}")
	public String mainPageMember(Model model, @PathVariable Integer groupId) {
		
		List<MemberMainBean> members = groupService.getMembersInGroup(groupId);
		model.addAttribute("membersInGroup", members);
		
		//for group_navbar
		GroupMainBean groupMain = groupService.getByGroupId(groupId);
		model.addAttribute("groupMain", groupMain);
		
		return "group/group_members";
	}

	// 傳回社團主頁的照片
	@RequestMapping(value = "/getGroupImage/{groupId}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getGroupImage(@PathVariable Integer groupId) {
		GroupMainBean bean = groupService.getByGroupId(groupId);
		return ImageUtils.byteArrayToImage(bean.getGroupImage());
	}

	// 處理加入或進入{groupId}社團
	@RequestMapping(method = RequestMethod.POST, value = "/group/addgroup/{groupId}")
	public String processAddGroup(@PathVariable Integer groupId, HttpSession session, Model model) {
		Integer memId = (Integer) session.getAttribute("memberId");
		// 未登入不可加入社團
		if (memId == null) {
			return "not_login";
		}
		if (groupService.statusApplyGroup(groupId, memId).equals("IN")) {
			return "redirect:/group/" + groupId; // 已經在社團中了，前端按鈕顯示為進入社團
		} else if (groupService.statusApplyGroup(groupId, memId).equals("NOT_IN")) {
			groupService.memberAddToGroupApply(groupId, memId);
			model.addAttribute("status", "申請成功，待批准");
			return "redirect:/groups/groups_type";
		} else { //
			model.addAttribute("status", "申請中");
			return "redirect:/group/" + groupId; // 已經在申請中，前端按鈕顯示為申請中
		}
	}

}
