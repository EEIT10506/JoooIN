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
import com.joooin.system.group.service.GroupService;


@Controller
public class GroupController {
	@Autowired
	GroupService service;
	
	@Autowired
	ServletContext context;
	
	//回社團主頁
	@RequestMapping(method = RequestMethod.GET, value = "/groups")
	public String groupPage() {
		return "group/groups";
	}

}
