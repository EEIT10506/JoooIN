package com.joooin.system.member._27.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joooin.model.NotificationBean;
import com.joooin.repository.NotificationDao;
import com.joooin.system.member._27.pojo.NotificationPojo;
import com.joooin.system.member._27.service.MemberService;
import com.joooin.system.member._27.service.NotificationService;

@Service
@Transactional
public class NotificationServiceImpl implements NotificationService {
	@Autowired
	NotificationDao notificationDao;
	@Autowired
	MemberService memberService;
	
	@Override
	public Integer getNotiNotReadQuantity(Integer memberId) {
		List<NotificationBean> list = notificationDao.getAll();
		Integer quantity = 0;
		
		for (NotificationBean bean : list) {
			if (bean.getMemberId().equals(memberId) && !bean.getIsRead()) 
				quantity++;
		}
		return quantity;
	}
		
	@Override
	public void setOneNotificationRead(Integer notificationId) {
		notificationDao.getByNotificationId(notificationId).setIsRead(true);
	}	

	@Override
	public void setAllNotificationsRead(Integer memberId) {
		System.out.println("進入service");
		notificationDao.setAllIsReadTrueByMemberId(memberId);
	}

	@Override
	public List<NotificationPojo> getNotifications(Integer memberId) {
		List<NotificationBean> origList = notificationDao.getAll();
		List<NotificationPojo> newList = new ArrayList<NotificationPojo>();
		
		for (NotificationBean bean : origList) {
			if (bean.getMemberId().equals(memberId)) {
				NotificationPojo pojo = new NotificationPojo();
				String str = bean.getNotificationContent();
				
				pojo.setLinkId(Integer.valueOf(str.split("=")[1]));
				pojo.setNotificationId(bean.getNotificationId());
				pojo.setMemberId(bean.getMemberId());
				pojo.setNotificationDate(bean.getNotificationDate());
				pojo.setIsRead(bean.getIsRead());
				
				if (str.indexOf("friend") == 0) {
					pojo.setType("好友");
					String name = memberService.getMemberMainBean(pojo.getLinkId()).getMemberName();
					
					if (str.contains("request")) pojo.setContent("您收到了會員「" + name + "」的好友邀請");
					if (str.contains("accepted")) pojo.setContent("會員「" + name + "」已接受您的好友申請");
				}				
				else if (str.indexOf("event") == 0) {
					pojo.setType("活動");
					String name = memberService.getEventMainBean(pojo.getLinkId()).getEventName();
					
					if (str.contains("modified")) pojo.setContent("您的活動「" + name + "」之活動內容已變更");
					else if (str.contains("joined")) pojo.setContent("您已成功加入活動「" + name + "」");
					else if (str.contains("reject")) pojo.setContent("您已被退出活動「" + name + "」");
					else if (str.contains("request")) pojo.setContent("您的活動「" + name + "」有新會員申請報名");
				}				
				else if (str.indexOf("group") == 0) {
					pojo.setType("社團");
					String name = memberService.getGroupMainBean(pojo.getLinkId()).getGroupName();
					
					if (str.contains("joined")) pojo.setContent("您已成功加入社團「" + name + "」");
					else if (str.contains("reject")) pojo.setContent("您已被退出社團「" + name + "」");
					else if (str.contains("request")) pojo.setContent("您的社團「" + name + "」有新會員申請加入");
				}				
//				else if (str.indexOf("punish") == 0) {
//					pojo.setType("處罰");
//					String eventName = memberService.getEventMainBean(pojo.getLinkId()).getEventName();
//					String groupName = memberService.getGroupMainBean(pojo.getLinkId()).getGroupName();
//					
//					if (str.contains("event_attend")) 
//						pojo.setContent("您因無故未出席活動「" + eventName + "」，將暫時停用您的活動功能，詳細內容請至您的 EMAIL 查閱");
//					else if (str.contains("event_post")) 
//						pojo.setContent("您因在活動「" + eventName + "」留下不雅言詞，將暫時停用您的活動留言功能，詳細內容請至您的 EMAIL 查閱");
//					else if (str.contains("group_post")) 
//						pojo.setContent("您因在社團「" + groupName + "」發文中留下不雅言詞，將暫時停用您的社團發文功能，詳細內容請至您的 EMAIL 查閱");
//					else if (str.contains("group_reply")) 
//						pojo.setContent("您因在社團「" + groupName + "」留言中留下不雅言詞，將暫時停用您的社團留言功能，詳細內容請至您的 EMAIL 查閱");
//				}
				newList.add(pojo);
			}
				
		}
		return newList;
	}

	
}
