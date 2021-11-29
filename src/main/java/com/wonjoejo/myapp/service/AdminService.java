package com.wonjoejo.myapp.service;

import java.util.List;

import com.wonjoejo.myapp.domain.AdminCriteria;
import com.wonjoejo.myapp.domain.MemberVO;

public interface AdminService {

	// 전체 회원 목록 조회
	public abstract List<MemberVO> viewMemberList();
	
	// 특정 회원 상세조회
	public abstract MemberVO viewMemberDetail(String member_id);
	
	// 특정 회원 검색
	public abstract List<MemberVO> searchMember(String member_id, String name);
	
	// 목록 페이징 처리
	public abstract List<MemberVO> getMemberList(AdminCriteria mcri);
	
	// 총 레코드 개수
	public abstract Integer getTotalCount(String member_id);
	
	// 전체 회원 검색 목록 
    public abstract List<MemberVO> getsearchPage(AdminCriteria mcri);
	
	// 개인 회원 검색 목록 
    public abstract List<MemberVO> getsearchPage0(AdminCriteria mcri);
    
    // 기업 회원 검색 목록
    public abstract List<MemberVO> getsearchPage1(AdminCriteria mcri);
    
    // 검색 총 레코드 개수
    public abstract Integer getsearchTotal(AdminCriteria mcri);

	
} // end interface
