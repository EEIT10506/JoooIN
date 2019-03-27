package com.joooin.system.group._42.service;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.joooin.model.EventPostBean;
import com.joooin.model.GroupMainBean;
import com.joooin.model.GroupPostBean;
import com.joooin.model.GroupPostReplyBean;
import com.joooin.model.ReportBean;
import com.joooin.repository.GroupPostReplyDao;
import com.joooin.system.group._22.pojo.Replyer;

public interface GroupService_42 {
	List<GroupMainBean> getAll();
	
	List<GroupMainBean> getGroupType(String groupOneType);
	
	public void updateGroupType(Integer groupId, String type);
	
	public void updateGroupName(Integer groupId, String groupname);
	
	public void updateGroupIntro(Integer groupId, String groupintro);

	public void updateGroupPostIsDeleted(GroupPostBean groupPostBean);
	
//	public void  updateGroupReplyPostIsDeleted(GroupPostReplyBean groupPostReplyBean);
	
//	public String reportGroupProcess(ReportBean rb, RedirectAttributes redirectAttributes,Integer groupId,Integer groupPostId);


	
//	public String getNewReplyForm(Model model, HttpSession session); 
//	
//	public String processNewReplyForm(HttpSession session,String groupPostReplyContent);

}