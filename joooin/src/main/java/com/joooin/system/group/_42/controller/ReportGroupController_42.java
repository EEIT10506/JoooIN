package com.joooin.system.group._42.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.joooin.model.ReportBean;
import com.joooin.repository.GroupMemberDao;
import com.joooin.system.admin._03.service.ReportService;
import com.joooin.system.group._22.service.GroupService_22;
import com.joooin.system.group._42.service.GroupService_42;

@Controller
public class ReportGroupController_42 {
	@Autowired
	GroupMemberDao groupMemberDao;

	@Autowired
	GroupService_42 service;

	@Autowired
	GroupService_22 service2;

	@Autowired
	ServletContext context;

	@Autowired
	ReportService reportService;
	
	@RequestMapping(value = "/report/{reportId}/{reportName}", method = RequestMethod.GET)
	public String reportGroupPage(Model model,@PathVariable("reportId") Integer memberId, HttpSession session,@PathVariable("reportName") String memberName) {
		
		Integer memberIdNow = (Integer) session.getAttribute("memberId");
		if (memberIdNow == null) {
			return "not_login";
		}
		
		ReportBean rb = new ReportBean();
		model.addAttribute("reportBean", rb);
		return "admin/report" ;
	}
	
	@RequestMapping(value ="/report/{reportId}/{reportName}", method = RequestMethod.POST)
	public String reportGroupProcess(@ModelAttribute("reportBean")ReportBean rb, RedirectAttributes redirectAttributes,@PathVariable("reportId") Integer memberId, Integer groupId,String memberName,
			HttpSession session) {
		session.removeAttribute("memberName");
		
		session.getAttribute(memberName);
		
		
		rb.setReportViolatorId(memberId);
		reportService.ReportBeanSave(rb);
		
		redirectAttributes.addFlashAttribute("success", "檢舉成功");
		
		return "redirect:/report/"+ memberId+"/"+memberName;
	}
	
}