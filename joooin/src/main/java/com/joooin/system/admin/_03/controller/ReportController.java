package com.joooin.system.admin._03.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.joooin.model.ReportBean;
import com.joooin.system.admin._03.service.ReportService;

@Controller
public class ReportController {
	
	@Autowired
	ReportService reportService;
	
	@RequestMapping(value = "/report", method = RequestMethod.GET)
	public String reportPage(Model model) {
		ReportBean rb = new ReportBean();
		model.addAttribute("reportBean", rb);
		return "admin/report";
	}
	
	@RequestMapping(value ="/report", method = RequestMethod.POST)
	public String reportProcess(@ModelAttribute("reportBean")ReportBean rb, RedirectAttributes redirectAttributes) {
		rb.setReportViolatorId(2);
		reportService.ReportBeanSave(rb);
		
		redirectAttributes.addFlashAttribute("success", "檢舉成功");
		
		return "redirect:/report";
	}
	
	@RequestMapping(value ="/admin/getUnprocessedReport", method = RequestMethod.GET)
	public @ResponseBody List<ReportBean> getUnprocessedReportBean() {
		List<ReportBean> list = reportService.getUnprocessedReportBean();
		return list;
	}
}
