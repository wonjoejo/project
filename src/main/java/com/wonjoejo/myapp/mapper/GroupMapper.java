package com.wonjoejo.myapp.mapper;

import com.wonjoejo.myapp.domain.BoxPermissionMemberVO;
import com.wonjoejo.myapp.domain.BoxPermissionVO;
import com.wonjoejo.myapp.domain.MemberVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GroupMapper {
	
	public abstract List<MemberVO> selectGroupMemberList(Integer box_no); 
	
	public abstract List<BoxPermissionMemberVO> selectGroupPermissionList(Integer box_no);

	public abstract List<BoxPermissionVO> selectGroupPermission(Integer box_no);

	public abstract int insertMember(BoxPermissionVO boxPermission);

	public abstract int updateMember(BoxPermissionVO boxPermission);

	public abstract int deleteMember(BoxPermissionVO boxPermission);

	public abstract BoxPermissionVO checkMaster(@Param("member_id") String member_id, @Param("box_no") Integer box_no);

	public abstract String findMember(String member_id);

	public abstract int updateMaster(@Param("member_id") String member_id, @Param("box_no") Integer box_no, @Param("master_per") Integer master_per);

	public abstract int deleteMember(@Param("member_id") String member_id, @Param("box_no") Integer box_no, @Param("member_stat") Integer member_stat);
} //end interface
