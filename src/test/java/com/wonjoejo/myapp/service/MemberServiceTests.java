package com.wonjoejo.myapp.service;

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
@ContextConfiguration(
        {
                "file:src/main/webapp/WEB-INF/spring/root-context.xml",
                "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
        }
)
public class MemberServiceTests {

    @Setter(onMethod_= {@Autowired})
    private MemberService service;

    @Before
    public void setUp() {

        log.debug("setup() invoked.");

        assert this.service != null;
        log.info("\t+ service: {}",this.service);

    } // setup

    
    // 회원가입
    @Test(timeout=1000)
    public void testRegister() {
        log.debug("testRegister() invoked.");

        MemberVO member = new MemberVO(
                "servicetest",
                0,
                0,
                "테스트",
                "1004",
                "test@gmail.com",
                "01012345678",
                "photo_name",
                "photo_path",
                null, null
        );

        boolean isSuccess = this.service.register(member);

        log.info("Member registered successfully: {}",isSuccess);

    } // testRegister

    // 회원 정보 수정
    @Test(timeout=1000)
    public void testEditMember() {

        log.debug("testEditMember() invoked");

        MemberVO member = new MemberVO(
        		 "servicetest",
                 null,
                 null,
                 "이름변경",
                 "edit123",
                 "edit@gmail.com",
                 "01023456789",
                 "edit_photo_name",
                 "edit_photo_path",
                 null, null
         );

        boolean isSuccess = this.service.editMember(member);

        log.info("Member edited successfully: {}",isSuccess);
    } // testEditMember
    
    // 회원 탈퇴
    @Test(timeout=1000)
    public void testDeleteAccount() {

        log.debug("testDeleteAccount() invoked.");

        String member_id = "servicetest";
        boolean isSuccess = this.service.deleteAccount(member_id);

        log.info("Account deleted successfully: {}",isSuccess);
    } // testDeleteAccount

} // end class
