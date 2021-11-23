package com.wonjoejo.myapp.mapper;

import java.util.List;

import com.wonjoejo.myapp.domain.AdminCriteria;
import com.wonjoejo.myapp.domain.MemberVO;

public interface AdminMapper {
	
	// 전체 회원 목록 조회
	public abstract List<MemberVO> selectMemberList();
	
	// 특정 회원 상세조회 
	public abstract MemberVO readMember(String member_id);
	
	// 회원 검색 -> 아이디, 이름으로 목록 조회
	public abstract List<MemberVO> selectMember(String member_id, String name);
    
	// 목록 페이징 처리
	public abstract List<MemberVO> getListPaging(AdminCriteria mcri);
	
	// 총 레코드 수 반환
	public abstract Integer getTotalCount(String member_id);

} // end interface
