package com.wonjoejo.myapp.service;

import java.util.List;

import com.wonjoejo.myapp.domain.BoxPermissionVO;
import com.wonjoejo.myapp.domain.MemberVO;

public interface GroupService {
	
	//그룹원을 보기 위한 리스트 
	public abstract List<MemberVO> selectGroupMemberList(Integer box_no);
	
	//권한 설정을 위한 리스트
	public abstract List<BoxPermissionVO> selectGroupPermissionList(Integer box_no);
	
	//그룹원 초대
	public abstract boolean joinGroup(BoxPermissionVO boxPermission);
	
	//그룹원 권한 설정
	public abstract boolean permissionGroup(BoxPermissionVO boxPermission);
	
	//그룹원 탈퇴 
	public abstract boolean outGroup(BoxPermissionVO boxPermission);
	
	
}

