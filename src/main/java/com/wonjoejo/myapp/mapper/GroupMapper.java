package com.wonjoejo.myapp.mapper;

import java.util.List;

import com.wonjoejo.myapp.domain.BoxPermissionMemberVO;
import com.wonjoejo.myapp.domain.BoxPermissionVO;
import com.wonjoejo.myapp.domain.MemberVO;

public interface GroupMapper {
	
	public abstract List<MemberVO> selectGroupMemberList(Integer box_no); 
	
	public abstract List<BoxPermissionMemberVO> selectGroupPermissionList(Integer box_no);
	
	public abstract List<BoxPermissionVO> selectGroupPermission(Integer box_no);
	
	public abstract int insertMember(BoxPermissionVO boxPermission);
	
	public abstract int updateMember(BoxPermissionVO boxPermission);
	
	public abstract int deleteMember(BoxPermissionVO boxPermission);
	
} //end interface
