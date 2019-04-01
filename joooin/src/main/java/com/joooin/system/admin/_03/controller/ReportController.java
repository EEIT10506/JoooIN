package com.joooin.system.admin._03.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.joooin.model.ReportBean;
import com.joooin.system.admin._03.model.ReportPojo;
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
	public @ResponseBody List<ReportPojo> getUnprocessedReportBean() {
		List<ReportPojo> list = reportService.getAllReportPojo();
		return list;
	}
	
	@RequestMapping(value = "/admin/reportPDF", method = RequestMethod.GET)
	public ModelAndView reportPdf() {
		List<ReportBean> list = reportService.getAlldReportBean();
		return new ModelAndView("reportPdfView", "allReport", list);
	}
	
	@RequestMapping(value = "/admin/getReportBean/{reportId}", method = RequestMethod.GET)
	public @ResponseBody ReportBean getReportBean(@PathVariable("reportId") Integer reportId) {
		return reportService.getReportBean(reportId);
	}
	
	@RequestMapping(value = "/admin/reportProcess", method = RequestMethod.POST)
	public @ResponseBody String reportProcess(@RequestParam("reportId")Integer reportId, @RequestParam("punishMemberId")Integer punishMemberId
			, @RequestParam("punishDateEnd")Integer punishDateEnd, @RequestParam("punishType")String punishType) {
		ReportBean rb = reportService.getReportBean(reportId);
		rb.setIsDone(true);
		reportService.PunishmentBeanSave(reportId, punishMemberId, punishDateEnd, punishType);
		
		reportService.ReportBeanSave(rb);
		return "";
	}
}
