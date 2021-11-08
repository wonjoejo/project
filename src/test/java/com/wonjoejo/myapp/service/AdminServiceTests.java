package com.wonjoejo.myapp.service;

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
@ContextConfiguration(
        {
                "file:src/main/webapp/WEB-INF/spring/root-context.xml",
                "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
        }
)
public class AdminServiceTests {

    @Setter(onMethod_= { @Autowired})
    private AdminService service;

    @Before
    public void setUp() {

        log.debug("setup() invoked.");

        assert this.service != null;
        log.info("\t+ service: {}",this.service);

    } // setup

    @Test(timeout=1000)
    public void testViewMemberList() {

        log.debug("viewMemberList() invoked.");

        String member_id = "";
        List<MemberVO> list = this.service.viewMemberList(member_id);

        assert list != null;
        list.forEach(log::info);

    } // testViewMemberList

    @Test(timeout=1000)
    public void testViewMemberDetail() {

        log.debug("viewMemberDetail() invoked.");

        String member_id = "";
        MemberVO member = this.service.viewMemberDetail(member_id);

        assert member != null;
        log.info("\t+ member: {}",member);

    } // testViewMemberDetail

    @Test(timeout=1000)
    public void testSearchMember() {

        log.debug("searchMember() invoked.");

        String member_id = "";
        String name="";
        MemberVO member = this.service.searchMember(member_id, name);

        assert member != null;
        log.info("\t+ member: {}",member);

    } // testSearchMember
    
} // end class
