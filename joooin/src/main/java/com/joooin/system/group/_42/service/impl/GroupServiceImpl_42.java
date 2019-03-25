package com.joooin.system.group._42.service.impl;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.joooin.model.GroupMainBean;
import com.joooin.model.GroupPostBean;
import com.joooin.model.ReportBean;
import com.joooin.repository.GroupMainDao;
import com.joooin.repository.GroupPostDao;
import com.joooin.repository.GroupPostReplyDao;
import com.joooin.repository.MemberMainDao;
import com.joooin.repository.ReportDao;
import com.joooin.system.admin._03.service.ReportService;
import com.joooin.system.group._22.pojo.Poster;
import com.joooin.system.group._42.service.GroupService_42;
@Service
@Transactional
public class GroupServiceImpl_42 implements GroupService_42 {
	@Autowired
	SessionFactory factory;
	
	@Autowired
	GroupMainDao dao;
	
	@Autowired
	ReportDao reportdao;
	
	@Autowired
	GroupPostReplyDao postdao;
	
	@Autowired
	GroupPostDao groupPostDao;
	
	@Autowired
	MemberMainDao memMainDao;
	
	@Override
	public List<GroupMainBean> getAll() {
		// TODO Auto-generated method stub
		return dao.getAll();
	}

	@Override
	public List<GroupMainBean> getGroupType(String groupOneType) {
		// TODO Auto-generated method stub
		return dao.getGroupType(groupOneType);
	}

	@Override
	public void updateGroupType(Integer groupId,String type) {
		GroupMainBean bean = dao.getByGroupId(groupId);
		bean.setGroupType(type);
		dao.update(bean);
	}

	@Override
	public void updateGroupName(Integer groupId, String groupname) {
		GroupMainBean bean = dao.getByGroupId(groupId);
		bean.setGroupName(groupname);
		dao.update(bean);
		
	}

	@Override
	public void updateGroupIntro(Integer groupId, String groupintro) {
		GroupMainBean bean = dao.getByGroupId(groupId);
		bean.setGroupIntro(groupintro);
		dao.update(bean);
		
	}
	
	
//	@Override
//	public String reportGroupProcess(ReportBean rb, RedirectAttributes redirectAttributes, Integer groupId,
//			Integer groupPostId) {
//		Poster poster =new Poster();
//		poster.setGroupPostId(poster.getGroupPostId()); 
//		return ;
//	}

	
	
//	@Override
//	public String processNewReplyForm(HttpSession session, String groupPostReplyContent) {
//		Integer memId = (Integer) session.getAttribute("memberId");
//		
//		return null;
//	}
//
//	@Override
//	public String getNewReplyForm(Model model, HttpSession session) {
//		// TODO Auto-generated method stub
//		return null;
//	}

	

}