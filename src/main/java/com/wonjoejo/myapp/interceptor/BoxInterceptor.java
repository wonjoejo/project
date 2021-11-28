package com.wonjoejo.myapp.interceptor;

import com.wonjoejo.myapp.domain.BoxPermissionVO;
import com.wonjoejo.myapp.domain.BoxVO;
import com.wonjoejo.myapp.service.BoxService;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@Log4j2
@NoArgsConstructor

@Component
public class BoxInterceptor
	implements HandlerInterceptor {
	// 1. BOX STATUS (삭제된 박스가 아닌지) 체크
	// 2. BOX PERMISSION (해당 박스 그룹에 포함된 회원인지) 체크

	@Setter(onMethod_= {@Autowired})
	private BoxService boxService;

	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse res, Object handler,
						   ModelAndView modelAndView) throws Exception {

		HttpSession session = req.getSession();
		// Log-in 시 Session에 저장된 로그인 한 아이디 가져옴 (return 시킬 때 필요)
		String member_id = (String) session.getAttribute("member_id");

		if(member_id!=null) {
			// BOX 입장 시 "permission"이라는 이름으로 저장된 입장한 멤버의 박스 권한 객체 가져옴
			BoxPermissionVO permission =(BoxPermissionVO) session.getAttribute("permission");

			// uri parameter로 준 박스 넘버 가져오기
			String boxParam = req.getParameter("box_no");
			log.info("========= box_no Parameter: {}",boxParam);



			// 박스 그룹 회원이 아닐 시, Box List로 튕겨냄
			if(permission == null) {
				res.sendRedirect("/box/list?member_id="+member_id);
			} // if

			log.info("\t+ permission: {}", permission);

			// 입장한 박스 번호 알아내기
			Integer box_no = permission.getBox_no();

			// Box 정보 확인해서 삭제된 박스인지 확인 (1. session에 있는 box, 2.parameter로 강제로 들어간 box)
			BoxVO box = this.boxService.getBox(box_no);
			BoxVO boxInParam = this.boxService.getBox(Integer.parseInt(boxParam));
			assert box != null;
			Integer boxStatusOfBox = box.getBox_status();
			Integer boxStatusOfBoxInParam = boxInParam.getBox_status();

			log.info("===================입장한 박스: {} / 파라미터 박스: {}================",boxStatusOfBox,boxStatusOfBoxInParam);

			// 삭제된 박스이면 박스 리스트로 튕겨냄
			if(boxStatusOfBox==1 || boxStatusOfBoxInParam ==1) {
				log.info("==================삭제된 박스==================");
				res.sendRedirect("/box/list?member_id="+member_id);
			} // if
		} else {
			res.sendRedirect("/member/login");
		}
	}
} // end class
