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
		Integer ab = (Integer) session.getAttribute("admin");
		System.out.println("session.getAttribute(\"memberId\")="+session.getAttribute("memberId"));
		if (mmb != null || ab !=null) {
			return true;
		} else {
			response.sendRedirect(request.getContextPath() + "/login");
			System.out.println("session.getAttribute(\"memberId\")="+session.getAttribute("memberId"));
			return false;
		}
		
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
