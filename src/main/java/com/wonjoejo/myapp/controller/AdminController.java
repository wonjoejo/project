package com.wonjoejo.myapp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wonjoejo.myapp.domain.AdminCriteria;
import com.wonjoejo.myapp.domain.MemberVO;
import com.wonjoejo.myapp.domain.PageDTO;
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
	@GetMapping("/listPerPage")
	public String list(@ModelAttribute("mcri") AdminCriteria mcri, 
 			Model model, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		log.debug("list({}) invoked.",model);
		
		List<MemberVO> list = this.service.getMemberList(mcri);
		log.info("\t+ list size: {}",list.size());
		
		model.addAttribute("list",list);
		model.addAttribute("member_id", session.getAttribute("member_id"));
		
		String member_id = (String)session.getAttribute("member_id");
		
		// 페이지 처리
		Integer totalAmount = this.service.getTotalCount(member_id);
	    PageDTO pageDTO = new PageDTO(mcri, totalAmount);
 		model.addAttribute("pageMaker",pageDTO);
 		
		
		return "/admin/list";
	} // viewMemberList
	
	// 특정 회원 상세조회 요청 
    @GetMapping("/detail")
    public void detail(String member_id, Model model) {
    	log.debug("detail({},{}) invoked.", member_id, model);
	
    	MemberVO member = this.service.viewMemberDetail(member_id);
		log.info("\t+ member: {}",member);
		
		model.addAttribute("member", member);
    } // viewMemberDetail
	
    // 회원 검색
    @GetMapping("/search")
    public void search(String member_id, String name, Model model) {
    	log.debug("search({},{},{}) invoked.", member_id, name, model);
    	
    	List<MemberVO> list = this.service.searchMember(member_id, name);
		log.info("\t+ list size: {}",list.size());
		
		model.addAttribute("list", list);
    } // searchMember
    
    // 개인 회원 검색 리스트
    @GetMapping("/searchList0")
	public String searchList0(@ModelAttribute("mcri") AdminCriteria mcri, Model model) {
			
		log.debug("searchList({}) invoked.", model);
		
		String keyword = mcri.getKeyword();
		log.info("\t + keyword: {}", keyword);

		mcri.setKeyword(keyword.replace(" ", ""));
		log.info("\t + mcri.keyword: {}", mcri.getKeyword());
		
		List<MemberVO> searchList = this.service.getsearchPage0(mcri);
		log.info("\t+ list size:{}", searchList.size());

		model.addAttribute("searchList", searchList);
		
		Integer totalAmount = this.service.getsearchTotal(mcri);

		PageDTO pageDTO = new PageDTO(mcri, totalAmount);

		model.addAttribute("pageMaker", pageDTO);

		//list.jsp 그대로 사용
		return "/admin/searchList0";
	}//searchList0
		
    // 기업 회원 검색 리스트
    @GetMapping("/searchList1")
	public String searchList1(@ModelAttribute("mcri") AdminCriteria mcri, Model model) {
			
		log.debug("searchList1({}) invoked.", model);
		
		String keyword = mcri.getKeyword();
		log.info("\t + keyword: {}", keyword);

		mcri.setKeyword(keyword.replace(" ", ""));
		log.info("\t + mcri.keyword: {}", mcri.getKeyword());
		
		List<MemberVO> searchList = this.service.getsearchPage1(mcri);
		log.info("\t+ list size:{}", searchList.size());

		model.addAttribute("searchList", searchList);
		
		Integer totalAmount = this.service.getsearchTotal(mcri);

		PageDTO pageDTO = new PageDTO(mcri, totalAmount);

		model.addAttribute("pageMaker", pageDTO);

		//list.jsp 그대로 사용
		return "/admin/searchList1";
	} //searchList1
    
} // end class
