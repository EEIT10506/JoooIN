package com.joooin.system.group._22.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.joooin.model.GroupMainBean;
import com.joooin.model.MemberMainBean;
import com.joooin.system.group._22.service.GroupService_22;
import com.joooin.system.member._27.service.MemberService;
import com.joooin.util.ImageUtils;

@Controller
public class EnterGroupController {

	@Autowired
	GroupService_22 groupService;

	@Autowired
	ServletContext context;

	// 依照groupId個別社團主頁連結
	@RequestMapping(method = RequestMethod.GET, value = "/group/{groupId}")
	public String groupMainPage(Model model, @PathVariable Integer groupId) {

		GroupMainBean groupMain = groupService.getByGroupId(groupId);
		model.addAttribute("groupMain", groupMain);
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
		
		
		return "group/group_members";
	}
	
	
	//傳回社團主頁的照片
	@RequestMapping(value = "/getGroupImage/{groupId}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getGroupImage(@PathVariable Integer groupId) {
		GroupMainBean bean = groupService.getByGroupId(groupId);
	    return ImageUtils.byteArrayToImage(bean.getGroupImage());
	}
}

