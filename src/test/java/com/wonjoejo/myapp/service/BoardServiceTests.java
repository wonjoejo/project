package com.wonjoejo.myapp.service;


import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wonjoejo.myapp.domain.BoardVO;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RunWith(SpringJUnit4ClassRunner.class)
//@RunWith(SpringRunner.class)
@ContextConfiguration(
        locations= {
                "file:src/main/webapp/WEB-INF/spring/root-context.xml",
                "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
        })

public class BoardServiceTests {

    @Setter(onMethod_= {@Autowired})
    private BoardService service;

    @Before
    public void setup() {
        log.debug("setup() invoked.");

        //DI 검증 수행
        assertNotNull(this.service);
        log.info("\t+ service: {}", this.service);

    }//setup

    @Test(timeout=1000)
    public void testGetList() {
        log.debug("testGet() invoked.");

        List<BoardVO> board = this.service.getList();

        assert board != null;

        board.forEach(log::info);
    }//testGetList

}
