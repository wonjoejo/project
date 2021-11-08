package com.wonjoejo.myapp.mapper;


import com.wonjoejo.myapp.domain.BaseCategoryVO;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
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
public class BaseCategoryTests {

    @Setter(onMethod_= { @Autowired } )
    private BaseCategoryMapper mapper;

    @Before
    public void setup(){
        log.debug("setup() invoked.");

        assert this.mapper != null;
        log.info("\t+ mapper : {}", this.mapper);
        log.info("\t+ type : {}", this.mapper.getClass().getName());
    } // setup

    @Test
    public void testGetBaseCategoryList(){
        log.debug("testGetBaseCategoryList() invoked.");

        Integer product_no = 211;

        List<BaseCategoryVO> list = this.mapper.selectBaseCategoryList(product_no);
        list.forEach(log::info);

    } // testGetBaseCategoryList



} // end class
