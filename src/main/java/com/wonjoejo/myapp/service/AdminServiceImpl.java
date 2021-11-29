package com.wonjoejo.myapp.service;

import java.util.List;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wonjoejo.myapp.domain.AdminCriteria;
import com.wonjoejo.myapp.domain.MemberVO;
import com.wonjoejo.myapp.mapper.AdminMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Service
public class AdminServiceImpl implements AdminService, InitializingBean, DisposableBean {

    @Setter(onMethod_= {@Autowired})
    private AdminMapper mapper;
    
    // 전체 회원 목록 조회
    @Override
    public List<MemberVO> viewMemberList() {
    	log.debug("viewMemberList({}) invoked.");
    	
    	return this.mapper.selectMemberList();
    } // viewMemberList
    
    // 특정 회원 상세조회
    @Override
    public MemberVO viewMemberDetail(String member_id) {
    	log.debug("viewMemberDetail({}) invoked.", member_id);
		
    	MemberVO member = this.mapper.readMember(member_id);
		log.info("\t+ member: {}", member);
		
    	return member;
    } // viewMemberDetail
    
    // 특정 회원 검색
    @Override
    public List<MemberVO> searchMember(String member_id, String name) {
    	log.debug("searchMember({}, {}) invoked.", member_id, name);
		
    	List<MemberVO> list=this.mapper.selectMember(member_id, name);
    	
    	list.forEach(log::info);
    	
    	return list;
    } // searchMember
    
    // 페이징 처리
    @Override
	public List<MemberVO> getMemberList(AdminCriteria mcri) {
    	log.debug("getMemberList({}) invoked.",mcri);
		

		List<MemberVO> list = this.mapper.getListPaging(mcri);

		list.forEach(log::info);

		log.info("\t+ list size:{} ",list.size());
		
		return list;
	} // getMemberList
    
    // 총 레코드 수
 	@Override
 	public Integer getTotalCount(String member_id) {
 	log.debug("getTotalCount({}) invoked.", member_id);
 	
 	return this.mapper.getTotalCount(member_id);
 	} // getTotalCount
 	
 	// 전체 회원 검색 페이지 
   	@Override
   	public List<MemberVO> getsearchPage(AdminCriteria mcri) {
   		log.debug("getListPerPage({}) invoked.",mcri);
   		
   		List<MemberVO> list = this.mapper.getsearchPage(mcri);
   		log.info("\t+ list size:{} ",list.size());
   		
   		return list;
   	}//getsearchPage
 	
    // 개인 회원 검색 페이지 
  	@Override
  	public List<MemberVO> getsearchPage0(AdminCriteria mcri) {
  		log.debug("getListPerPage({}) invoked.",mcri);
  		
  		List<MemberVO> list = this.mapper.getsearchPage0(mcri);
  		log.info("\t+ list size:{} ",list.size());
  		
  		return list;
  	}//getsearchPage0
  	
  	// 기업 회원 검색 페이지 
   	@Override
   	public List<MemberVO> getsearchPage1(AdminCriteria mcri) {
   		log.debug("getListPerPage({}) invoked.",mcri);
   		
   		List<MemberVO> list = this.mapper.getsearchPage1(mcri);
   		log.info("\t+ list size:{} ",list.size());
   		
   		return list;
   	} // getsearchPage1

  	// 검색 총 개수 
  	@Override
  	public Integer getsearchTotal(AdminCriteria mcri) {
  		log.debug("getTotal() invoked.");	
  		return this.mapper.getSearchCount(mcri);
  	} // getsearchTotal
    
	@Override
	public void destroy() throws Exception {
		log.debug("destroy({}) invoked.");
		
	} // destroy

	@Override
	public void afterPropertiesSet() throws Exception {
		log.debug("afterPropertiesSet({}) invoked.");
		
		assert this.mapper != null;
		log.info("\t+ mapper:" + this.mapper);
	} // afterPropertiesSet



	
} // end class
