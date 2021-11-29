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
		log.debug("testInsertMember() invoked.");
		
		Integer member_type=0;
		Integer member_status=0;
		
		MemberVO member = new MemberVO(
				 "mappertest",
				 member_type,
				 member_status,
                 "테스트",
                 "1004",
                 "test@gmail.com",
                 "01012345678",
                 "photo_name",
                 "photo_path",
                 null, null, null, null
		);

		this.mapper.insertMember(member);
		log.info("\t+ member: {}",member);

	} // testInsertMember

	@Test
	public void testUpdateMember() {
		log.debug("testUpdateMember() invoked.");

		MemberVO member = new MemberVO(
			 	"mappertest",
                 null,
                 null,
                 "개명함",
                 "edit",
                 "edit@gmail.com",
                 "01023456789",
                 "edit_photo_name",
                 "edit_photo_path",
                 null, null, null, null
		);
		this.mapper.updateMember(member);
		
		log.info("\t+ member:{}",member);
	} // testUpdateMember

	@Test
	public void testDeleteMember() {
		log.debug("testDeleteMember() invoked.");

		String member_id = "mappertest";

		this.mapper.deleteMember(member_id);

		log.info("\t+ member_id:{}",member_id);
	} // testDeleteMember

	@Test
	public void testFindId() {
		log.debug("testFindId() invoked.");

		String name = "지현";
		String email = "j@naver.com";

		MemberVO member = this.mapper.selectId(email, name);

		log.info("\t+ member_id:{}",member);
	} // testFindId
	
	@Test
	public void testMemberId() {
		log.debug("testMemberId() invoked.");
		
		String member_id="c3";
		
		MemberVO member = this.mapper.selectMemberId(member_id);

		log.info("\t+ member_id:{}",member);
	} // testMemberId

} // end class
