package com.joooin.system.group;

import java.time.LocalDateTime;
import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.joooin.model.GroupMainBean;
import com.joooin.model.MemberMainBean;
import com.joooin.system.group._22.service.GroupService_22;
import com.joooin.system.group.service.GroupService;


@Controller
public class GroupController {
	@Autowired
	GroupService service;
	
	@Autowired
	GroupService_22 groupService22;
	
	@Autowired
	ServletContext context;
	
	//回社團主頁
	@RequestMapping(method = RequestMethod.GET, value = "/groups")
	public String groupPage() {
		return "group/groups";
	}

	
	// 進入社團發文頁面
		@RequestMapping(method = RequestMethod.GET, value = "/group/post/{groupId}")
		public String mainPagePost(Model model, @PathVariable Integer groupId ){
			List<MemberMainBean> members = groupService22.getMembersInGroup(groupId);
			model.addAttribute("membersInGroup", members);
			
			//for group_navbar
			GroupMainBean groupMain = groupService22.getByGroupId(groupId);
			model.addAttribute("groupMain", groupMain);
			
			
			return "group/group_post";
		}
}
