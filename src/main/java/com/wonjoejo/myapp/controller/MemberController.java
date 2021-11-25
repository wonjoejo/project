package com.wonjoejo.myapp.controller;

import com.google.gson.Gson;
import com.wonjoejo.myapp.domain.LoginDTO;
import com.wonjoejo.myapp.domain.MemberDTO;
import com.wonjoejo.myapp.domain.MemberVO;
import com.wonjoejo.myapp.service.MemberService;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.Date;

@Log4j2
@NoArgsConstructor

@RequestMapping(value="/member", method= {RequestMethod.GET, RequestMethod.POST})
@Controller
public class MemberController {
	
	// 권한
	public static final String authKey="__AUTH__";
	
	@Setter(onMethod_= { @Autowired })
	private MemberService service;
	
	// 회원가입
	@PostMapping("/registerPost")
	public String register(MemberDTO member, RedirectAttributes rttrs, MultipartFile file) {
		log.debug("register({}, {}) invoked.",member, file);
		
		MemberVO memberVO;
		
		// 0 : 개인, 1 : 기업
		if(member.getMember_type()==0) { // 개인
			memberVO = new MemberVO(
					member.getMember_id(),
					0,
					0,
					member.getName(),
					member.getPassword(),
					member.getEmail(),
					member.getPhone_number(),
					member.getPhoto_name(),
					member.getPhoto_path(),
					null,
					null,
					null,
					null
			);
			
		boolean result = this.service.register(memberVO);
		log.info("\t +result: {}",result);
		rttrs.addAttribute("result",result);
		
		} else { // 기업
			memberVO = new MemberVO(
					member.getMember_id(),
					1,
					0,
					member.getName(),
					member.getPassword(),
					member.getEmail(),
					member.getPhone_number(),
					member.getPhoto_name(),
					member.getPhoto_path(),
					member.getCompany_name(),
					null,
					null,
					null
			);
			
		boolean result = this.service.register(memberVO);
		log.info("\t +result: {}",result);
		rttrs.addAttribute("result",result);
		
			
		} // if-else
		
		return "/member/loginIndex";
	} // register
	
	// 로그인
	@PostMapping("/loginPost")
	public void loginPost(
			LoginDTO dto, Model model, HttpSession session) throws Exception {

		log.debug("loginPost({}) invoked.", dto);
		
		MemberVO member=this.service.login(dto);
		log.info("\t+ member: {}", member);
		
		if(member!=null) {

			model.addAttribute(MemberController.authKey, member);
		
			//자동 로그인 처리 추가 (rememberMe)
			if(dto.getRememberMe()!=null) { // on
				
				String member_id=dto.getMember_id();				
				String session_id=session.getId();

				long now=System.currentTimeMillis();
				
				long timeAmount=60*60*24*7*1000; // 일주일..
				Date rememberAge=new Date(now + timeAmount);
				
				this.service.editMemberWithRememberMe(member_id, session_id, rememberAge);
			} // if

			log.info("여기왔나");

		} // if
	} // loginPost
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		log.debug("logout({}) invoked.", session);
		
		session.removeAttribute(MemberController.authKey);
		
		log.info("\t+ Sesson ID to be destroyed: {}", session.getId());
		
		session.invalidate();
		session=null;
		
		return "redirect:/";
		
	} // logout
	
	// 회원 정보 수정
	@PostMapping("/edit")
	public String edit(MemberDTO member, RedirectAttributes rttrs) throws Exception {
		log.debug("edit({}) invoked.",member);
		
		
//		MemberVO memberVO = new MemberVO(
//				member.getMember_id(),
//				null,
//				null,
//				member.getName(),
//				member.getPassword(),
//				member.getEmail(),
//				member.getPhone_number(),
//				member.getPhoto_name(),
//				member.getPhoto_path(),
//				member.getCompany_name(),
//				null,
//				null,
//				null
//		);
//
//		boolean result = this.service.editMember(memberVO);
//		log.info("\t +result: {}",result);
//		rttrs.addAttribute("result",result);
//		
//		
		MemberVO memberVO;
		
		// 0 : 개인, 1 : 기업
		if(member.getMember_type()==0) { // 개인
			memberVO = new MemberVO(
					member.getMember_id(),
					0,
					0,
					member.getName(),
					member.getPassword(),
					member.getEmail(),
					member.getPhone_number(),
					member.getPhoto_name(),
					member.getPhoto_path(),
					null,
					null,
					null,
					null
			);
			
		boolean result = this.service.editMember(memberVO);
		log.info("\t +result: {}",result);
		rttrs.addAttribute("member_id",member.getMember_id());
		
		return "redirect:/member/myPage";
		} else { // 기업
			memberVO = new MemberVO(
					member.getMember_id(),
					1,
					0,
					member.getName(),
					member.getPassword(),
					member.getEmail(),
					member.getPhone_number(),
					member.getPhoto_name(),
					member.getPhoto_path(),
					member.getCompany_name(),
					null,
					null,
					null
			);
			
		boolean result = this.service.editMember(memberVO);
		log.info("\t +result: {}",result);
		rttrs.addAttribute("member_id",member.getMember_id());
		
		return "redirect:/member/myPage";
			
		} // if-else
		
	} // edit
	
	
	// 회원 탈퇴 -> memberstatus : 1
	@PostMapping("/delete")
	public String delete(String member_id, RedirectAttributes rttrs) {
		log.debug("delete({}) invoked.",member_id);

		boolean result = this.service.deleteAccount(member_id);
		log.info("\t +result: {}",result);
		rttrs.addAttribute("\t+ result: {}",result);

		return "redirect:/";
	} // delete

	@GetMapping("/login")
	public void login() {

	}
	
	@GetMapping(value = {"/register", "/loginIndex"})
	public void register() {

	}


	@GetMapping("/myPage")
	public void edit(String member_id, Model model) {
		log.debug("myPage invoked.");

		MemberVO member = this.service.getMember(member_id);
		log.info("\t+ member: {}", member);

		model.addAttribute("member", member);

	}

	@GetMapping(value = "/profile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String profile(String member_id) {
		log.debug("profile({}) invoked.", member_id);

		MemberVO member = this.service.getMember(member_id);
		log.info("\t+ member: {}", member);

		Gson gson = new Gson();

		return gson.toJson(member);

	} // profile


} // end class
