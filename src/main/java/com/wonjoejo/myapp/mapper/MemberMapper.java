package com.wonjoejo.myapp.mapper;

import java.util.Date;

import com.wonjoejo.myapp.domain.LoginDTO;
import com.wonjoejo.myapp.domain.MemberVO;
import org.apache.ibatis.annotations.Param;

public interface MemberMapper {

	// 회원가입
	public abstract Integer insertMember(MemberVO member);
	
	// 로그인
	public abstract MemberVO selectMember(LoginDTO dto) throws Exception;
	
	// 자동 로그인
	public abstract MemberVO selectMemberWithRemberMe(String rememberMe) throws Exception;
	public abstract Integer updateMemberWithRememberMe(@Param("member_id") String member_id, @Param("rememberme") String rememberMe, @Param("rememberage") Date rememberAge) throws Exception;
	
	public abstract MemberVO selectUserByRememberMe(String remeberMe) throws Exception;
	
	// 아이디 찾기
	public abstract MemberVO selectId(String email);
	
	// 비밀번호 변경
	public abstract MemberVO updatePwd(String email);
	
	// 회원 정보 가져오기
	public abstract MemberVO selectMemberInfo(String member_id);
	
	// 회원 정보 수정
	public abstract Integer updateMember(MemberVO member);
	
	// 회원 탈퇴
	public abstract Integer deleteMember(String member_id);
	
} // end interface
