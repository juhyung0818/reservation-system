package com.juhyung.reservation.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("login").equals("OK")){
			System.out.println("login hello");
		}else{
			System.out.println("login XXXX");
			response.sendRedirect("/login");
		}
		
		System.out.println("pre handle");
		return true;
	}
	

		
}
