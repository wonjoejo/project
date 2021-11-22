package com.wonjoejo.myapp.service;

import com.wonjoejo.myapp.domain.BoxPermissionMemberVO;
import com.wonjoejo.myapp.domain.BoxPermissionVO;
import com.wonjoejo.myapp.domain.MemberVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GroupService {

    //그룹원을 보기 위한 리스트
    public abstract List<MemberVO> selectGroupMemberList(Integer box_no);

    //권한 설정을 위한 리스트
    public abstract List<BoxPermissionMemberVO> selectGroupPermissionList(Integer box_no);

    //그룹원 초대
    public abstract boolean joinGroup(BoxPermissionVO boxPermission);

    //그룹원 권한 설정
    public abstract boolean permissionGroup(BoxPermissionVO boxPermission);

    //그룹원 탈퇴
    public abstract boolean outGroup(BoxPermissionVO boxPermission);

    public abstract boolean checkMaster(String member_id, Integer box_no);

    // 회원 검색 (양도)
    public abstract String findMember(String keyword);

    public abstract boolean updateMaster(@Param("member_id") String member_id, @Param("box_no") Integer box_no, @Param("master_per") Integer master_per);


}

