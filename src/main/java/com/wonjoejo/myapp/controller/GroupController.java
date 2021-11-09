package com.wonjoejo.myapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wonjoejo.myapp.domain.BoxPermissionDTO;
import com.wonjoejo.myapp.domain.BoxPermissionVO;
import com.wonjoejo.myapp.domain.MemberVO;
import com.wonjoejo.myapp.service.GroupService;

import lombok.NoArgsConstructor;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RequestMapping("/group")
@Controller
public class GroupController {

	@Setter(onMethod_= {@Autowired})
	private GroupService service;
	
	//그룹원 목록
	@GetMapping("/grouplist")
	public void grouplist(Model model, Integer box_no) {
		
		log.debug("grouplist({},{}) invoked.",model,box_no);
			
		List<MemberVO> list = this.service.selectGroupMemberList(box_no);
		
		log.info("\t+list.size{}",list.size());
		
		model.addAttribute("list",list);
		
	}//grouplist 
	
	//그룹원 권한 목록
	@GetMapping("/permissionlist")
	public void permissionlist(Model model, Integer box_no) {
		
		log.debug("permissionlist({},{}) invoked.",model,box_no);
			
		List<BoxPermissionVO> list = this.service.selectGroupPermissionList(box_no);
		
		log.info("\t+list.size{}",list.size());
		
		model.addAttribute("list",list);
		
	}//permissionlist 

	//그룹원 가입
	@GetMapping("/join")
	public String join(BoxPermissionDTO boxPermission, RedirectAttributes rttrs) {
		
		log.debug("join({}) invoked", boxPermission);
		
		BoxPermissionVO boxPermissionVO = new BoxPermissionVO(
				null,
				boxPermission.getBox_no(), 
				boxPermission.getMember_id(),
				boxPermission.getMaster_per(), 
				boxPermission.getWrite_per(), 
				boxPermission.getRead_per(),
				boxPermission.getEdit_per(), 
				boxPermission.getDelete_per(), 
				boxPermission.getMember_stat()
				);
		
		boolean result = this.service.joinGroup(boxPermissionVO);
		log.info("\t +result: {}",result);
		rttrs.addAttribute("result",result);
		
		return "/group/grouplist";
	}// join 
	
	//그룹원 권한 설정 
	@GetMapping("/grouppermission")
	public String grouppermission(BoxPermissionDTO boxPermission, RedirectAttributes rttrs) {
		
		log.debug("grouppermission({}) invoked.", boxPermission);
		
		BoxPermissionVO boxPermissionVO = new BoxPermissionVO(
				boxPermission.getNo(),
				boxPermission.getBox_no(), 
				boxPermission.getMember_id(),
				boxPermission.getMaster_per(), 
				boxPermission.getWrite_per(), 
				boxPermission.getRead_per(),
				boxPermission.getEdit_per(), 
				boxPermission.getDelete_per(), 
				boxPermission.getMember_stat()
				);
		
		boolean result = this.service.permissionGroup(boxPermissionVO);
		log.info("\t +result: {}",result);
		rttrs.addAttribute("result",result);
		
		return "/group/permissionlist";
	}//groupout
	
	//그룹원 탈퇴
	@GetMapping("/groupout")
	public String groupout(BoxPermissionDTO boxPermission, RedirectAttributes rttrs) {
	
		log.debug("groupout({}) invoked.", boxPermission);
		
		BoxPermissionVO boxPermissionVO = new BoxPermissionVO(
				boxPermission.getNo(),
				boxPermission.getBox_no(), 
				boxPermission.getMember_id(),
				boxPermission.getMaster_per(), 
				boxPermission.getWrite_per(), 
				boxPermission.getRead_per(),
				boxPermission.getEdit_per(), 
				boxPermission.getDelete_per(), 
				boxPermission.getMember_stat()
				);
		
		boolean result = this.service.outGroup(boxPermissionVO);
		log.info("\t +result: {}",result);
		rttrs.addAttribute("result",result);
		
		return "/group/grouplist";
	}//groupout
	
}//end class
