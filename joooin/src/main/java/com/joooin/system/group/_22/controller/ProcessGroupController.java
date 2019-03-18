package com.joooin.system.group._22.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joooin.model.MemberMainBean;
import com.joooin.system.group._22.service.GroupService_22;

@Controller
public class ProcessGroupController {
	@Autowired
	GroupService_22 service;
	@Autowired
	ServletContext context;
	
	// Ajax送回申請清單
	@RequestMapping(method = RequestMethod.GET, value = "/group/applygroup/{groupId}")
	@ResponseBody
	public List<MemberMainBean> getGroupApplyList(@PathVariable Integer groupId, Model model) {
		
		List<MemberMainBean> groupApplyList = service.getGroupApplyMembers(groupId);
		
//		model.addAttribute("applyList", groupApplyList);
		
		return groupApplyList;
	}
	
	// Ajax送回處理後的申請清單
	@RequestMapping(method = RequestMethod.POST, value =
			"/group/applygroup/{groupId}/member/{memberId}/result/{decide}")
	@ResponseBody
	public List<MemberMainBean> processGroupApplyList(@PathVariable Integer groupId, 
			@PathVariable Integer memberId, @PathVariable String decide ) {
		
		Integer sss = service.processApplyList(groupId, memberId, decide);
		
		System.out.println(sss); //紀錄成功入團的會員
		
		List<MemberMainBean> groupApplyList = service.getGroupApplyMembers(groupId);
		
		return groupApplyList;
	}
	
}
