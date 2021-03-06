package com.joooin.system.group._22.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joooin.model.MemberMainBean;
import com.joooin.system.group._22.service.GroupNotification;
import com.joooin.system.group._22.service.GroupService_22;

@Controller
public class ProcessGroupController {
	@Autowired
	GroupService_22 service;
	@Autowired
	ServletContext context;
	@Autowired
	GroupNotification notifGroup;
	
//	// Ajax送回申請清單
//	@RequestMapping(method = RequestMethod.GET, value = "/group/applygroup/{groupId}")
//	@ResponseBody
//	public List<MemberMainBean> getGroupApplyList(@PathVariable Integer groupId, Model model) {
//		
//		List<MemberMainBean> groupApplyList = service.getGroupApplyMembers(groupId);
//		
////		model.addAttribute("applyList", groupApplyList);
//		
//		return groupApplyList;
//	}
	
	// Ajax送回處理後的申請清單
	@RequestMapping(method = RequestMethod.POST, value =
			"/group/applygroup/{groupId}/member/{memberId}/result/{decide}")
	@ResponseBody
	public List<MemberMainBean> processGroupApplyList(@PathVariable Integer groupId, 
			@PathVariable Integer memberId, @PathVariable String decide ) {
		
		System.out.println("處理資訊進來了");
		System.out.println("G::" + groupId);
		System.out.println("M::" + memberId);
		System.out.println("D::" + decide);
		// 根據approve，reject 改變清單中的會員狀態，許可的話回傳新增的會員ID
		Integer acceptMember = service.processApplyList(groupId, memberId, decide);
		
		// 允許入團通知 該會員
		if( ! acceptMember.equals(null)) {
			notifGroup.groupNotifJoined(acceptMember, groupId);
		}
		
		System.out.println(acceptMember); //紀錄成功入團的會員
		
//		List<MemberMainBean> groupApplyList = service.getGroupApplyMembers(groupId);
		
		
		return null;
	}
	
}
