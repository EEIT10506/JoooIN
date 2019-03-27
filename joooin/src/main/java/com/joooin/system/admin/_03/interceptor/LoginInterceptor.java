package com.joooin.system.admin._03.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.joooin.model.AdminBean;
import com.joooin.model.MemberMainBean;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		Integer mmb = (Integer) session.getAttribute("memberId");
		Integer ab = (Integer) session.getAttribute("adminId");
		if (mmb != null || ab !=null) {
			if(mmb != null) {
				response.sendRedirect(request.getContextPath());
			}
			if(ab != null) {
				response.sendRedirect(request.getContextPath() + "/admin");
			}
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}

}
