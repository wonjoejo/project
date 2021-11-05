package com.wonjoejo.myapp.mapper;

import com.wonjoejo.myapp.domain.BoardVO;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@Log4j2
@NoArgsConstructor

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardMapperTests {

    @Setter(onMethod_= {@Autowired})
    private BoardMapper mapper;

    @Before
    public void setup() {		//사전처리 : 주입받은 객체가 null 인지 체크
        log.debug("setup() invoked.");

        assert this.mapper != null;

        log.info("\t+ mapper:{}", this.mapper);
        log.info("\t+ type:{}", this.mapper.getClass().getName());
    }//setup

    @Test
    public void testGetList() {
        log.debug("testGetList() invoked.");

        List<BoardVO> list = this.mapper.getList();
        list.forEach(log::info); //람다식과 메소드 참조라는 것을 알아야한다

    }//testGetList

    @After
    public void tearDawn() {
        log.debug("tearDawn() invoked.");

    }//tearDawn

}
