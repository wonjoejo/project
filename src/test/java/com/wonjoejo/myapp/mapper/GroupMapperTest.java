package com.wonjoejo.myapp.mapper;

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
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class GroupMapperTest {
	
	@Setter(onMethod_= { @Autowired })
	private GroupMapper mapper;
	
	@Before
	public void setup() {
		
		log.debug("setup() invoked.");
		
		assert this.mapper != null;
		log.info("\t+ mapper: {}", this.mapper);
		log.info("\t+ type: {}", this.mapper.getClass().getName());
		
	} // setup
	
	// 그룹원 목록
	@Test
	public void testselectGroupMemberList() {

		log.debug("testselectGroupMemberList() invoked.");
		Integer box_no = 1098;

		List<MemberVO> list = this.mapper.selectGroupMemberList(box_no);
		
		list.forEach(log::info);


	} // testselectGroupMemberList
	
	// 그룹 권한 리스트 
		@Test
		public void testselectGroupPermissionList() {

			log.debug("testselectGroupPermissionList() invoked.");
			Integer box_no = 1098;
			

			List<BoxPermissionVO> list = this.mapper.selectGroupPermissionList(box_no);
			list.forEach(log::info);


		} // testselectGroupPermissionList

	//그룹 초대
		@Test
		public void testinsertMember(){
			log.debug("testinsertMember() invoked.");
			
			BoxPermissionVO boxPermission = new BoxPermissionVO(
					null,
					"MEMBERid100",
					1098,
					1,
					1,
					0,
					1,
					1,
					0		
			);
			
			this.mapper.insertMember(boxPermission);
		}
		
	// 그룹 권한 설정
		@Test
		public void testupdateMember(){
			log.debug("testupdateMember() invoked.");
			
			BoxPermissionVO boxPermission = new BoxPermissionVO(
					212,
					"MEMBERid100",
					1098,
					1,
					1,
					1,
					1,
					1,
					1		
			);
			this.mapper.updateMember(boxPermission);
			log.info("\t+ boxPermission:{}",boxPermission);
		}//updateMember
		
	// 그룹 탈퇴
		@Test
		public void testdeletMember(){
			log.debug("testdeletMember() invoked.");
			
			
			BoxPermissionVO boxPermission = new BoxPermissionVO(
					208,
					"MEMBERid100",
					1098,
					1,
					1,
					1,
					1,
					1,
					1		
			);
			this.mapper.deleteMember(boxPermission);
			log.info("\t+ boxPermission:{}",boxPermission);
		}//testdeletMember
}
