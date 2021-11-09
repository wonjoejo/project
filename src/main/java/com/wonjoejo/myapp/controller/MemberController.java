package com.wonjoejo.myapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wonjoejo.myapp.domain.MemberDTO;
import com.wonjoejo.myapp.domain.MemberVO;
import com.wonjoejo.myapp.service.MemberService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RequestMapping("/member")
@Controller
public class MemberController {
	
	@Setter(onMethod_= { @Autowired })
	private MemberService service;
	
	// 회원가입
	@PostMapping("/register")
	public String register(MemberDTO member, RedirectAttributes rttrs) {
		log.debug("register({}) invoked.",member);

		MemberVO memberVO = new MemberVO(
				member.getMember_id(),
				member.getMember_type(),
				member.getMember_status(),
				member.getName(),
				member.getPassword(),
				member.getEmail(),
				member.getPhone_number(),
				member.getPhoto_name(),
				member.getPhoto_path(),
				member.getCompany_name(),
				null
		);

		boolean result = this.service.register(memberVO);
		log.info("\t +result: {}",result);
		rttrs.addAttribute("result",result);

		return "/member/login";
	} // register
	
	// 회원 정보 수정
	@PostMapping("/edit")
	public String edit(MemberDTO member, RedirectAttributes rttrs) {
		log.debug("edit({}) invoked.",member);

		MemberVO memberVO = new MemberVO(
				member.getMember_id(),
				null,
				null,
				member.getName(),
				member.getPassword(),
				member.getEmail(),
				member.getPhone_number(),
				member.getPhoto_name(),
				member.getPhoto_path(),
				null,
				null
		);

		boolean result = this.service.editMember(memberVO);
		log.info("\t +result: {}",result);
		rttrs.addAttribute("result",result);

		return "/member/mypage";
	} // edit
	
	// 회원 탈퇴
	@PostMapping("/delete")
	public String delete(String member_id, RedirectAttributes rttrs) {
		log.debug("delete({}) invoked.",member_id);

		boolean result = this.service.deleteAccount(member_id);
		log.info("\t +result: {}",result);
		rttrs.addAttribute("\t+ result: {}",result);

		return "/";
	} // delete

    
} // end class
