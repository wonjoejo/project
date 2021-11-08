package com.wonjoejo.myapp.service;

import com.wonjoejo.myapp.domain.MemberVO;

public interface MemberService {

	// 회원가입
	public abstract boolean register(MemberVO member);
	
	// 로그인
	public abstract MemberVO login(String member_id, String password);
	
	// 아이디 찾기
	public abstract MemberVO logout(String email);
	
	// 비밀번호 변경
	public abstract MemberVO changePwd(String email);
	
	// 회원 정보 수정
	public abstract boolean editMember(MemberVO member);
	
	// 회원 탈퇴
	public abstract boolean deleteAccount(String member_id);

} // end interface
