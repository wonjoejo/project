package com.wonjoejo.myapp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.wonjoejo.myapp.controller.MemberController;
import com.wonjoejo.myapp.domain.MemberVO;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Component
public class AuthInterceptor 
	implements HandlerInterceptor {
	
	public static final String requestURIKey="__REQUEST_URI__";
	public static final String queryStringKey="__QUERYSTRING__";
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler)
			throws Exception {
		log.debug("===================================");
		log.debug("1. preHandle({}, {}, {}) invoked.", req, res, handler);
		log.debug("===================================");
		
		HttpSession session=req.getSession();
		MemberVO member=(MemberVO) session.getAttribute(MemberController.authKey);
		log.info("\t+ member: {}", member);
		
		if(member == null) {

			String originReqURI=req.getRequestURI();
			String originQueryString=req.getQueryString();
			
			session.setAttribute(AuthInterceptor.requestURIKey, originReqURI);
			session.setAttribute(AuthInterceptor.queryStringKey, originQueryString);
			
			res.sendRedirect("/member/login");
		} // if
		
		return true;
	} // preHandle
	
} // end class
