package com.spring_boot_dolls_ticket.project;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Component
public class AdminInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		String uri = request.getRequestURI();
		
		if (uri.startsWith("/admin")) {
			String administratorYn = (String)session.getAttribute("administratorYn");
			if (administratorYn == null || !administratorYn.equals("Y")) {
				response.setContentType("text/html; charset=UTF-8");
				response.getWriter().write("<script>setTimeout(function() {alert('접근 권한이 없습니다.'); window.location.href='/'; }, 1000);</script>");
				
				return false;
			}
		}
		
		return true;
	}
	
}
