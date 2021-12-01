package com.wonjoejo.myapp.mapper;


import com.wonjoejo.myapp.domain.AllCategoryVO;
import com.wonjoejo.myapp.domain.BaseCategoryVO;
import com.wonjoejo.myapp.domain.DeleteCategoryVO;
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

    @Setter(onMethod_ = {@Autowired})
    private BaseCategoryMapper mapper;

    @Before
    public void setup() {
        log.debug("setup() invoked.");

        assert this.mapper != null;
        log.info("\t+ mapper : {}", this.mapper);
        log.info("\t+ type : {}", this.mapper.getClass().getName());
    } // setup

    @Test
    public void testGetBaseCategoryList() {
        log.debug("testGetBaseCategoryList() invoked.");

        Integer box_no = 1339;
        BaseCategoryVO baseCategory = this.mapper.selectBaseCategoryList(box_no);
        log.info("\t+ baseCategory: {}", baseCategory);

    } // testGetBaseCategoryList

    @Test
    public void testGetAllCategoryList(){
        log.debug("testGetAllCategoryList() invoked.");

        Integer box_no = 1339;
        List<AllCategoryVO> category = this.mapper.selectCategory(box_no);
        log.info("\t+ category: {}", category);


    } // testGetAllCategoryList
    @Test
    public void testUpdateBaseCategory() {
        log.debug("testUpdateBaseCategory() invoked.");

        BaseCategoryVO baseCategory = new BaseCategoryVO(
                95919,
                "색상",
                null,
                null,
                null,
                null,
                1330
        );

        this.mapper.updateBaseCategory(baseCategory);
        log.info("\t+ baseCategory: {}", baseCategory);
    } // testUpdateBaseCategory

    @Test
    public void testDeleteBaseCategory() {
        log.debug("testDeleteBaseCategory() invoked.");

        BaseCategoryVO baseCategory = new BaseCategoryVO(
                95924,
                null,
                "사이즈",
                null,
                null,
                null,
                1339
        );

        this.mapper.updateBaseCategory(baseCategory);
        log.info("\t+ baseCategory: {}", baseCategory);

        DeleteCategoryVO allcategory = new DeleteCategoryVO(
                95924,
                "test",
                null,
                null,
                "test",
                null
        );

//        this.mapper.deleteCategory(allcategory);
        log.info("\t+ category : {}", allcategory);
    } //testDeleteBaseCategory


} // end class
