package com.wonjoejo.myapp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.wonjoejo.myapp.controller.MemberController;
import com.wonjoejo.myapp.domain.MemberVO;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Component
public class LoginInterceptor 
	implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler)
			throws Exception {
		log.debug("===================================");
		log.debug("1. preHandle({}, {}, {}) invoked.", req, res, handler);
		log.debug("===================================");
		
		HttpSession session=req.getSession();
		session.removeAttribute(MemberController.authKey);
		
		log.info("\t+ 이전에 바인딩 되어있을 수 있는 인증정보를 삭제");
	
		return true;
	} // preHandle

	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse res, Object handler,
			ModelAndView modelAndView) throws Exception {
		log.debug("===================================");
		log.debug("2. postHandle({}, {}, {}, {}) invoked.", req, res, handler, modelAndView);
		log.debug("===================================");
		
		HttpSession session=req.getSession();
		
		ModelMap modelMap=modelAndView.getModelMap();
		MemberVO member=(MemberVO) modelMap.get(MemberController.authKey);
		log.info("\t+ member: {}", member);
		
		if(member != null) {
			session.setAttribute(MemberController.authKey, member);

			String originRequestURI=(String) session.getAttribute(AuthInterceptor.requestURIKey);
			String originQueryString=(String) session.getAttribute(AuthInterceptor.queryStringKey);
			
			if(originRequestURI != null) { // 원래의 요청 URI가 있다면
				
				String originRequest="originRequestURI";
				
				if(originQueryString != null) { // 전송파라미터도 있다면
					originRequest+='?'+originQueryString;
				} else { // 전송파라미터가 없다면
					;; 
				} // if-else
				
				log.info("\t+ originRequest: {}", originRequest);
				res.sendRedirect(originRequest);
				
			} else { // 원래의 요청 URI가 없다면
				res.sendRedirect("/box/list"); // 로그인 -> 박스리스트로 이동 => 아이디 값 줘야 함
			} // if-else
				
			} else { // 로그인 실패
			 	res.sendRedirect("/member/login");
		} // if-else
		
	} // postHandle
	
	//------------------------------//
	
	@Override
	public void afterCompletion(HttpServletRequest req, HttpServletResponse res, Object handler, Exception e)
			throws Exception {
		log.debug("===================================");
		log.debug("3. afterCompletion({}, {}, {}, {}) invoked.", req, res, handler, e);
		log.debug("===================================");
	} // afterCompletion

} // end class
