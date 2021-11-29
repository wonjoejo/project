package com.wonjoejo.myapp.service;

import java.util.Date;

import org.apache.http.conn.MultihomePlainSocketFactory;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.EmitUtils;
import org.springframework.stereotype.Service;

import com.wonjoejo.myapp.domain.LoginDTO;
import com.wonjoejo.myapp.domain.MemberVO;
import com.wonjoejo.myapp.mapper.MemberMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Service
public class MemberServiceImpl implements MemberService, InitializingBean, DisposableBean {

    @Setter(onMethod_= {@Autowired})
    private MemberMapper mapper;

    // 회원 가입
    @Override
    public boolean register(MemberVO member) {
    	log.debug("register({}) invoked.", member);
    	
    	int affectedRows=this.mapper.insertMember(member);
		log.info("\t+ affectedRows: {}", affectedRows);
		
		return affectedRows==1;
    } // register
    
    // 로그인
    @Override
    public MemberVO login(LoginDTO dto) throws Exception {
    	log.debug("login({}) invoked.", dto);
		
		MemberVO member=this.mapper.selectMember(dto);
		log.info("\t+ member: {}", member);
    	
    	return member;
    }
   
    // 자동 로그인
	@Override
	public MemberVO findMemberByRemberMe(String rememberMe) throws Exception {
		log.debug("findMemberByRemberMe({}) invoked.", rememberMe);
		
		MemberVO member=this.mapper.selectMemberWithRemberMe(rememberMe);
		log.info("\t+ member: {}", member);
    	
    	return member;
	}
	
	@Override
	public boolean editMemberWithRememberMe(String member_id, String rememberMe, Date rememberAge) throws Exception {
		log.debug("editMemberWithRememberMe({}, {}, {}) invoked.", member_id, rememberMe, rememberAge);
		
		int affectedRows=this.mapper.updateMemberWithRememberMe(member_id, rememberMe, rememberAge);
		log.info("\t+ affectedRows: {}", affectedRows);
		
		return affectedRows==1;
	}
    
    // 아이디 찾기
    @Override
    public MemberVO findId(String email, String name) {
		log.debug("findId({}, {}) invoked.", email, name);

		MemberVO member = this.mapper.selectId(email, name);
        return member;
    } // findId

	@Override
	public MemberVO findPw(String member_id, String email) {
		log.debug("findPw({}, {}) invoked.", member_id, email);

		MemberVO member = this.mapper.selectPw(member_id, email);

		return member;
	} // findPw

	@Override
	public Boolean changePwd(String password, String member_id) {
		log.debug("changePwd({}, {}) invoked.", password, member_id);

		int affectedLines = this.mapper.updatePw(password, member_id);

		return affectedLines == 1;
	} // changePwd


	// 회원 정보 가져오기
    @Override
	public MemberVO getMember(String member_id) {
    	return this.mapper.selectMemberInfo(member_id);
	} // getMember
    
    // 회원 정보 수정
    @Override
    public boolean editMember(MemberVO member) {
    	log.debug("editMember({}) invoked.", member);
    	
    	int affectedRows=this.mapper.updateMember(member);
		log.info("\t+ affectedRows: {}", affectedRows);
		
		return affectedRows==1;
    } // editMember

    // 회원 탈퇴
    @Override
    public boolean deleteAccount(String member_id) {
    	log.debug("deleteAccount({}) invoked.", member_id);
    	
    	int affectedRows=this.mapper.deleteMember(member_id);
    	log.info("\t+ affectedRows: {}", affectedRows);
		
		return affectedRows==1;
    } // deleteAccount
	
    // 아이디 중복체크
	@Override
	public Integer idCheck(String member_id) {
		log.debug("idCheck({}) invoked.", member_id);
		
		int cnt=this.mapper.selectIdCheck(member_id);
		
		return  cnt;
	} // idCheck
	
	// 아이디 가져오기
	@Override
	public MemberVO getMemberId(String member_id) {
		
		MemberVO member = this.mapper.selectMemberId(member_id);

		return member;
	} // getMemberId
	
	@Override
	public void destroy() throws Exception {
		log.debug("destroy({}) invoked.");
		
	} // destroy

	@Override
	public void afterPropertiesSet() throws Exception {
		log.debug("afterPropertiesSet({}) invoked.");
		
	} // afterPropertiesSet


	

} // end class
