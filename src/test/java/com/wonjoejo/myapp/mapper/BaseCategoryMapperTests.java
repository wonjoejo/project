package com.wonjoejo.myapp.mapper;


import com.wonjoejo.myapp.domain.BaseCategoryDTO;
import com.wonjoejo.myapp.domain.BaseCategoryVO;
import com.wonjoejo.myapp.domain.BoxVO;
import com.wonjoejo.myapp.domain.CategoryVO;
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
public class BaseCategoryMapperTests {

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

        Integer box_no = 1331;
        BaseCategoryVO baseCategory = this.mapper.selectBaseCategoryList(box_no);
        log.info("\t+ baseCategory: {}", baseCategory);


        // Category detail
        Integer category_no = 95920;
        List<CategoryVO> category = this.mapper.selectCategory(category_no);
        log.info("\t+ category: {}", category);

    } // testGetBaseCategoryList

    @Test
    public void testUpdateBaseCategory(){
        log.debug("testUpdateBaseCategory() invoked.");

        BaseCategoryVO baseCategory = new BaseCategoryVO(
                95895,
                "색상",
                null,
                null,
                null,
                null,
                1096
        );

        this.mapper.updateBaseCategory(baseCategory);
        log.info("\t+ baseCategory: {}" , baseCategory);
    } // testUpdateBaseCategory

    @Test
    public void testDeleteBaseCategory(){
        log.debug("testDeleteBaseCategory() invoked.");

        BaseCategoryVO baseCategory = new BaseCategoryVO(
                95926,
                "색상1",
                "테스트1",
               null,
                null,
                null,
                1341
        );

        this.mapper.updateBaseCategory(baseCategory);
        log.info("\t+ baseCategory: {}" , baseCategory);


    } //testDeleteBaseCategory



} // end class
