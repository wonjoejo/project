package com.wonjoejo.myapp.service;

import java.util.Date;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.wonjoejo.myapp.domain.LoginDTO;
import com.wonjoejo.myapp.domain.MemberVO;

public interface MemberService {

	// 회원가입
	public abstract boolean register(MemberVO member);
	
	// 로그인
	public abstract MemberVO login(LoginDTO dto) throws Exception;
	
	// 자동 로그인
	public abstract MemberVO findMemberByRemberMe(String rememberMe) throws Exception;
	public abstract boolean editMemberWithRememberMe(String member_id, String rememberMe, Date rememberAge) throws Exception;	 
	
	// 아이디 찾기
	public abstract MemberVO findId(@Param("email") String email, @Param("name") String name);
	
	// 비밀번호 체크
	public abstract MemberVO findPw(@Param("member_id") String member_id, @Param("email") String email);

	// 비밀번호 변경
	public abstract Boolean changePwd(@Param("password") String password, @Param("member_id") String member_id);
	
	// 회원 정보 가져오기
	public abstract MemberVO getMember(String member_id);
	
	// 회원 정보 수정
	public abstract boolean editMember(MemberVO member);
	
	// 회원 탈퇴
	public abstract boolean deleteAccount(String member_id);

	// 아이디 중복체크
	public abstract Integer idCheck(String member_id);
	
	// 전체 회원 아이디 가져오기
	public abstract MemberVO getMemberId(String member_id);
	
	
} // end interface
