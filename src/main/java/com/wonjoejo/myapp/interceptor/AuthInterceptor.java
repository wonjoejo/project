package com.wonjoejo.myapp.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.util.WebUtils;

import com.wonjoejo.myapp.controller.MemberController;
import com.wonjoejo.myapp.domain.MemberVO;
import com.wonjoejo.myapp.service.MemberService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Component
public class AuthInterceptor 
	implements HandlerInterceptor {
	
	public static final String requestURIKey="__REQUEST_URI__";
	public static final String queryStringKey="__QUERYSTRING__";
	
	@Setter(onMethod_= {@Autowired})
	private MemberService service;
	
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
			
			Cookie rememberMeCookie=WebUtils.getCookie(req, LoginInterceptor.rememberMeKey);
			
			if(rememberMeCookie != null) { // 자동로그인 쿠키가 존재하면
				String rememberMe=rememberMeCookie.getValue();
				log.info("\t+ rememberMe: {}", rememberMe);
				
				member=this.service.findMemberByRemberMe(rememberMe);
				if(member != null) {
					session.setAttribute(MemberController.authKey, member);
					return true;
				} // if	
			} // if		

			res.sendRedirect("/member/login");
			return false;
		} // member==null if
		
		return true;
	} // preHandle
	
} // end class
