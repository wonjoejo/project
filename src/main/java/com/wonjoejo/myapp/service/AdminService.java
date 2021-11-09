package com.wonjoejo.myapp.service;

import java.util.List;

import com.wonjoejo.myapp.domain.MemberVO;

public interface AdminService {

	// 전체 회원 목록 조회
	public abstract List<MemberVO> viewMemberList(String member_id);
	
	// 특정 회원 상세조회
	public abstract MemberVO viewMemberDetail(String member_id);
	
	// 특정 회원 검색
	public abstract MemberVO searchMember(String member_id, String name);

} // end interface
