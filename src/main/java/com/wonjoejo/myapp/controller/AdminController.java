package com.wonjoejo.myapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wonjoejo.myapp.domain.MemberVO;
import com.wonjoejo.myapp.service.AdminService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RequestMapping("/admin")
@Controller
public class AdminController {
	
	@Setter(onMethod_= { @Autowired })
	private AdminService service;
	
	// 회원 목록 요청
	@GetMapping("/list")
	public void list(Model model) {
		
		log.debug("list({}) invoked.",model);
		
		List<MemberVO> list = this.service.viewMemberList();
		log.info("\t+ list size: {}",list.size());
		
		model.addAttribute("list",list);
		
	} // viewMemberList
	
	// 특정 회원 상세조회 요청 
    @GetMapping({"/detail"})
    public void detail(String member_id, Model model) {
    	log.debug("detail({},{}) invoked.", member_id, model);
	
    	MemberVO member = this.service.viewMemberDetail(member_id);
		log.info("\t+ member: {}",member);
		
		model.addAttribute("member", member);
    } // viewMemberDetail
	
    // 회원 검색
    @GetMapping({"/search"})
    public void search(String member_id, String name, Model model) {
    	log.debug("search({},{},{}) invoked.", member_id, name, model);
    	
    	List<MemberVO> list = this.service.searchMember(member_id, name);
		log.info("\t+ list size: {}",list.size());
		
		model.addAttribute("list", list);
    } // searchMember
    
} // end class
