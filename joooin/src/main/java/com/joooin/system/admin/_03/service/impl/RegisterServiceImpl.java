package com.joooin.system.admin._03.service.impl;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;

import org.apache.commons.lang3.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.joooin.model.MemberMainBean;
import com.joooin.repository.MemberMainDao;
import com.joooin.system.admin._03.service.RegisterService;

@Service
@Transactional
public class RegisterServiceImpl implements RegisterService {
	
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
}
