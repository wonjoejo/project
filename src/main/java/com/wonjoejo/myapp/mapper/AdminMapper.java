package com.wonjoejo.myapp.mapper;

import java.util.List;

import com.wonjoejo.myapp.domain.MemberVO;

public interface AdminMapper {
	
	// 전체 회원 목록 조회
	public abstract List<MemberVO> selectMemberList(String member_id);
	
	// 특정 회원 상세조회
	public abstract MemberVO read(String member_id);
	
	// 특정 회원 검색
	public abstract MemberVO selectMember(String member_id);

} // end interface
