package com.wonjoejo.myapp.service;

import java.util.List;
import java.util.Objects;

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
public class AdminServiceTests {

    @Setter(onMethod_= {@Autowired})
    private AdminService service;

    @Before
    public void setUp() {

        log.debug("setup() invoked.");

        assert this.service != null;
        log.info("\t+ service: {}",this.service);

    } // setup
    
    // 전체 회원 목록 조회
    @Test(timeout=1000)
    public void testViewMemberList() {

        log.debug("viewMemberList() invoked.");

        List<MemberVO> list = this.service.viewMemberList();

        assert list != null;
        list.forEach(log::info);

    } // testViewMemberList
    
    // 특정 회원 상세조회
    @Test(timeout=1000)
    public void testViewMemberDetail() {

        log.debug("viewMemberDetail() invoked.");

        String member_id = "MEMBERid99";
        MemberVO member = this.service.viewMemberDetail(member_id);

        Objects.requireNonNull(member);
        
        log.info("\t+ member: {}",member);

    } // testViewMemberDetail
    
    // 회원 검색
    @Test(timeout=1000)
    public void testSearchMember() {

        log.debug("searchMember() invoked.");
        
        
        // 입력한대로 검색되도록 바꿔야함!!
        String member_id = "MEMBERid50";
        String name="이름54";
        List<MemberVO> list = this.service.searchMember(member_id, name);

        assert list != null;
        list.forEach(log::info);

    } // testSearchMember
    
} // end class
