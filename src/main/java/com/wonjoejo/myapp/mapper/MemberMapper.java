package com.wonjoejo.myapp.mapper;

import com.wonjoejo.myapp.domain.MemberVO;

public interface MemberMapper {

	// 회원가입
	public abstract int insertMember(MemberVO member);
	
	// 로그인
	public abstract MemberVO loginMember(MemberVO member); // 이거 id랑 pwd 면 안되냐 ?
	
	// 아이디 찾기
	public abstract MemberVO selectId(String email);
	
	// 비밀번호 변경
	public abstract MemberVO updatePwd(String email);
	
	// 회원 정보 수정
	public abstract int updateMember(MemberVO member);
	
	// 회원 탈퇴
	public abstract int deleteMember(String member_id);
	
} // end interface
