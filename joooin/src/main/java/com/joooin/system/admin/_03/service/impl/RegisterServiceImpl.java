package com.joooin.system.admin._03.service.impl;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.ArrayUtils;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.joooin.model.MemberMainBean;
import com.joooin.repository.MemberMainDao;
import com.joooin.system.admin._03.service.RegisterService;

@Service
@Transactional
public class RegisterServiceImpl implements RegisterService {
	
	@Autowired
	JavaMailSender mailSender;
	@Autowired
	ServletContext context;
	@Autowired
	MemberMainDao dao;

	@Override
	public MemberMainBean getByMemberId(Integer memberId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemberMainBean> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer save(MemberMainBean memberMainBean) {
		if(memberMainBean!=null) {
			System.out.println("no null");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd ahh:mm:ss");
			memberMainBean.setMemberCreateDate(sdf.format(new Date()).toString());
			String m = "male";
			String f = "female";
			
			String code = memberMainBean.getCertificationHash();
			if(code!=null) {
				
			}
			
			if(memberMainBean.getGender().equals(m)) {
				ByteArrayOutputStream baos = new ByteArrayOutputStream();
				System.out.println("male");               
				String filePath = "/WEB-INF/resources/img/member_male.PNG";
				String root = context.getRealPath("/");
				root = root.substring(0, root.length()-1);
				String fileLoction = root + filePath;
				byte[] b = null;
				File file = new File(fileLoction);
				BufferedImage bi;
				try {
					bi = ImageIO.read(file);
					ImageIO.write(bi, "png", baos);
					b = baos.toByteArray();
					baos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
					Byte[] B = ArrayUtils.toObject(b);
					memberMainBean.setMemberImage(B);
					dao.save(memberMainBean);
					
			}
			if(memberMainBean.getGender().equals(f)) {
				ByteArrayOutputStream baos = new ByteArrayOutputStream();
				System.out.println("female");
				String filePath = "/WEB-INF/resources/img/member_female.PNG";
				String root = context.getRealPath("/");
				root = root.substring(0, root.length()-1);
				String fileLoction = root + filePath;
				byte[] b = null;
				File file = new File(fileLoction);
				BufferedImage bi;
				try {
					bi = ImageIO.read(file);
					ImageIO.write(bi, "png", baos);
					b = baos.toByteArray();
					baos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
					Byte[] B = ArrayUtils.toObject(b);
					memberMainBean.setMemberImage(B);
					dao.save(memberMainBean);
			}
		}else {
			System.out.println("null");
		}
		
		return null;
	}

	@Override
	public void update(MemberMainBean memberMainBean) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteByMemberId(Integer memberId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Boolean checkEmail(String email) {
		Boolean result = true;
		
		if(dao.checkEmail(email)==null) {
			result = false;
		}
		return result;
	}

	@Override
	public Boolean activeUser(String certificationHash) {
		Boolean activeUser = false;
		if(dao.activeUser(certificationHash)!=0) {
			activeUser = true;
		}
		return activeUser;
	}

	@Override
	public void certification(MemberMainBean mmb, HttpServletRequest request) {
		
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

			helper.setFrom("eeit105joooin@gmail.com");// 發件人
			helper.setTo(mmb.getEmail());// 收件人
			helper.setSubject("<重要> JOOOIN 認證信箱");// 主題
			helper.setText("<html><meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"><body>"
					+ "<h4>您的名稱:" + mmb.getMemberName() + "</h4><br><h4>請點："
					+"<a href='"
					+request.getScheme() + "://"
					+request.getServerName() 
					+":" + request.getServerPort()  + request.getContextPath()+"/registerEmail'>"
					+ "這裡驗證<br><p>joooin團隊敬上</p>" + "</body></html>", true);// 正文
		} catch (MessagingException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		mailSender.send(message);
		System.out.println("發送完成");
		
	}

	@Override
	public MemberMainBean checkCertification(String email) {
		return dao.checkEmail(email);
	}

	@Override
	public void certificationChangeStatus(String certificationHash) {
		dao.activeUser(certificationHash);
	}

}
