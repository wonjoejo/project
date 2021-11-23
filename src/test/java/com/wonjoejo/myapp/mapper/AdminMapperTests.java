package com.wonjoejo.myapp.mapper;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.wonjoejo.myapp.domain.MemberVO;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AdminMapperTests {
	
	@Setter(onMethod_= { @Autowired })
	private AdminMapper mapper;
	
	@Before
	public void setup() {
		
		log.debug("setup() invoked.");
		
		assert this.mapper != null;
		log.info("\t+ mapper: {}", this.mapper);
		log.info("\t+ type: {}", this.mapper.getClass().getName());
		
	} // setup
	
	// 전체 회원 목록
	@Test
	public void testSelectMemberList() {
		log.debug("testSelectMemberList() invoked.");
		
		List<MemberVO> list = this.mapper.selectMemberList();
		list.forEach(log::info);

	} // testSelectMemberList
	
	// 특정 회원 상세조회
	@Test
	public void testReadMember() {
		log.debug("testReadMember () invoked.");
		
		String member_id="MEMBERid3";
		MemberVO member = this.mapper.readMember(member_id);
		
		log.info("\t+ member:{}", member);		
	} // testRead
	 
	// 회원 검색
	@Test
	public void testSelectMember() {
	
		log.debug("testSelectMember() invoked.");

		String member_id = "MEMBERid5";
		String name="이름15";
		
		List<MemberVO> list = this.mapper.selectMember(member_id, name);
		
		log.info("\t+ list:{}", list);
	} // testSelectMember

} // end class
