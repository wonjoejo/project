package com.wonjoejo.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wonjoejo.myapp.domain.BoxPermissionMemberVO;
import com.wonjoejo.myapp.domain.BoxPermissionVO;
import com.wonjoejo.myapp.domain.MemberVO;
import com.wonjoejo.myapp.mapper.GroupMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Service
public class GroupServiceImpl implements GroupService{

	@Setter(onMethod_= {@Autowired})
	private GroupMapper mapper;

	// 그룹 멤버 리스트 조회
	@Override
	public List<MemberVO> selectGroupMemberList(Integer box_no) {
		log.debug("selectGroupMemberList() invoked.");
		
		List<MemberVO> list = this.mapper.selectGroupMemberList(box_no);
		
		list.forEach(log::info);
		
		return list;
	}//selectGroupMemberList
	

	//그룹원 권한 조회
	@Override
	public List<BoxPermissionMemberVO> selectGroupPermissionList(Integer box_no) {
		
		List<BoxPermissionMemberVO> list = this.mapper.selectGroupPermissionList(box_no);
		
		list.forEach(log::info);
		
		return list;
	}//selectGroupPermissionList

	//그룹원 초대
	@Override
	public boolean joinGroup(BoxPermissionVO boxPermission) {
		log.debug("joinGroup({}) invoked", boxPermission);
		
		int affectedRows = this.mapper.insertMember(boxPermission);
		
		return affectedRows == 1;
	}// joinGroup
	
	//그룹원의 권한 설정
	@Override
	public boolean permissionGroup(BoxPermissionVO boxPermission) {
		log.debug("permissionGroup({}) invoked", boxPermission);
		
		int affectedRows = this.mapper.updateMember(boxPermission);
		
		return affectedRows == 1;
	} //permissionGroup
	
	//그룹원 탈퇴
	@Override
	public boolean outGroup(BoxPermissionVO boxPermission) {
		log.debug("outGroup({}) invoked", boxPermission);
		
		int affectedRows = this.mapper.deleteMember(boxPermission);
		
		return affectedRows == 1;
	} //permissionGroup
	
} // end class
