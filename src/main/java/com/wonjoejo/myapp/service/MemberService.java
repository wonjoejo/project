package com.wonjoejo.myapp.service;

import com.wonjoejo.myapp.domain.LoginDTO;
import com.wonjoejo.myapp.domain.MemberVO;

import java.util.Date;

public interface MemberService {

	// 회원가입
	public abstract boolean register(MemberVO member);
	
	// 로그인
	public abstract MemberVO login(LoginDTO dto) throws Exception;
	
	// 자동 로그인
	public abstract MemberVO findMemberByRemberMe(String rememberMe) throws Exception;
	public abstract boolean editMemberWithRememberMe(String member_id, String rememberMe, Date rememberAge) throws Exception;	 
	
	// 계정 찾기를 MemberVO 주는 게 맞나?
	// 아이디 찾기
	public abstract MemberVO findId(String email);
	
	// 비밀번호 변경
	public abstract MemberVO changePwd(String email);
	
	// 회원 정보 수정
	public abstract boolean editMember(MemberVO member);
	
	// 회원 탈퇴
	public abstract boolean deleteAccount(String member_id);


} // end interface
