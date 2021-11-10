package com.wonjoejo.myapp.service;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.wonjoejo.myapp.domain.BoxPermissionVO;
import com.wonjoejo.myapp.domain.MemberVO;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RunWith(SpringRunner.class)
@ContextConfiguration(locations = { 
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })

public class GroupServiceTests {

	@Setter(onMethod_ = { @Autowired })
	private GroupService service;

	@Before
	public void setUp() {

		log.debug("setup() invoked.");

		assert this.service != null;
		log.info("\t+ service: {}", this.service);

	} // setup

	//그룹원 리스트
	@Test(timeout=1000) 
	public void testselectGroupMemberList() {
		
		log.debug("selectGroupMemberList() invoked.");
		

		
	}// selectGroupMemberList

	//그룹 가입 
	
	//그룹 권한 설정
	@Test(timeout=1000)
	public void testpermissionGroup() {
		log.debug("testpermissionGroup() invoked.");
		
		BoxPermissionVO boxPermission = new BoxPermissionVO(
				null,
				"MEMBERid100",
				1099,
				1,
				1,
				1,
				1,
				1,
				1
				);

		boolean isSuccess = this.service.permissionGroup(boxPermission);
		
		log.info("Group permission successfully: {}", isSuccess);
	}
	// 그룹 탈퇴
	@Test(timeout=1000)
	public void testoutGroup() {
		log.debug("testoutGroup() invoked.");
		
		BoxPermissionVO boxPermission = new BoxPermissionVO(
				1,
				"MEMBERid98",
				1097,
				1,
				1,
				1,
				1,
				1,
				1
				);

		boolean isSuccess = this.service.outGroup(boxPermission);
		
		log.info("Group out successfully: {}", isSuccess);
	}

} // end class
