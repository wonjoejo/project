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
	
	@Test
	public void testSelectMemberList() {

		log.debug("testSelectMemberList() invoked.");

		String member_id = "";

		List<MemberVO> list = this.mapper.selectMemberList(member_id);
		list.forEach(log::info);


	} // testSelectMemberList

	 @Test
		public void testRead() {
			log.debug("testRead () invoked.");
			
			String member_id="";
			MemberVO member = this.mapper.read(member_id);
			
			log.info("\t+ member:{}", member);		
		} // testRead

	 @Test
		public void testSelectMember() {

			log.debug("testSelectMember() invoked.");

			String member_id = "";
			MemberVO member = this.mapper.read(member_id);
			
			log.info("\t+ member:{}", member);
		} // testSelectMember

} // end class
