package com.wonjoejo.myapp.mapper;

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
public class MemberMapperTests {
	
	@Setter(onMethod_= { @Autowired })
	private MemberMapper mapper;
	
	@Before
	public void setup() {
		
		log.debug("setup() invoked.");
		
		assert this.mapper != null;
		log.info("\t+ mapper: {}", this.mapper);
		log.info("\t+ type: {}", this.mapper.getClass().getName());
		
	} // setup
	
	@Test
	public void testInsertMember() {
		log.debug("testInsertBox() invoked.");

		MemberVO member = new MemberVO(
				 "test",
                 0,
                 0,
                 "테스트",
                 "1004",
                 "test@gmail.com",
                 010-1234-5678,
                 "photo_name",
                 "photo_path",
                 null, null
		);

		this.mapper.insertMember(member);
		log.info("\t+ member:{}",member);

	} // testInsertMember

	@Test
	public void testUpdateMember() {
		log.debug("testUpdateMember() invoked.");

		MemberVO member = new MemberVO(
				 null,
                 null,
                 null,
                 "개명함",
                 "test123",
                 "edit@gmail.com",
                 010-2345-6789,
                 "edit_photo_name",
                 "edit_photo_path",
                 null, null
		);
		this.mapper.updateMember(member);
		log.info("\t+ member:{}",member);
	} // testUpdateMember

	@Test
	public void testDeleteMember() {
		log.debug("testDeleteMember() invoked.");

		String member_id = "test";

		this.mapper.deleteMember(member_id);

		log.info("\t+ member_id:{}",member_id);
	} // testDeleteMember

} // end class
