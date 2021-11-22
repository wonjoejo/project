package com.wonjoejo.myapp.service;


import com.wonjoejo.myapp.domain.AllCategoryVO;
import com.wonjoejo.myapp.domain.DeleteCategoryVO;
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
@ContextConfiguration(
        {
                "file:src/main/webapp/WEB-INF/spring/root-context.xml",
                "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
        }
)
public class BaseCategoryServiceTests {

    @Setter(onMethod_={@Autowired})
    private BaseCategoryService service;

    @Before
    public void setup(){
        log.debug("setup() invoked.");

        assert this.service != null;
        log.info("\t+ service: {} ", this.service);

    } // setup

    @Test(timeout = 1000)
    public void testGetBaseCategoryList(){

        log.debug("testGetBaseCategoryList() invoked");

        int box_no = 1318;
        BaseCategoryVO baseCategory = this.service.getBaseCategoryList(box_no);

        assert baseCategory != null;
        log.info("\t+ baseCategory : {}", baseCategory);

    } // testGetBaseCategoryList

    @Test(timeout = 1000)
    public void testAllBaseCategoryList(){
        log.debug("testAllBaseCategoryList() invoked");

        int box_no = 1339;
        List<AllCategoryVO> category = this.service.getCategoryList(box_no);

        assert category != null;
        log.info("\t+ allCategory: {}", category);
    } // testAllBaseCategoryList

    @Test(timeout = 1000)
    public void testEditBaseCategory(){
        log.debug("editBaseCategory() invoked.");

        BaseCategoryVO baseCategory = new BaseCategoryVO(
                95895,
                "색상",
                "사이즈",
                null,
                null,
                null,
                1096
        );

        boolean isSuccess = this.service.editBaseCategory(baseCategory);
        log.info("BaseCategory edited successfully: {}", isSuccess);

    } // editBaseCategory



    @Test(timeout =  1000)
    public void testDeleteCategory(){
        log.debug("testDeleteCategory() invoked.");

        BaseCategoryVO baseCategory = new BaseCategoryVO(
                95924,
                "",
                null,
                null,
                null,
                null,
                1339
        );

        boolean isSuccess =  this.service.editBaseCategory(baseCategory);
        log.info("BaseCategory edited succssfully: {}", isSuccess);

        DeleteCategoryVO category = new DeleteCategoryVO(
                95924,
                null,
                null,
                null,
                "test",
                null
        );

        boolean isSuccess2 = this.service.deleteCategory(category);
        log.info("Category edited successfully : {}", isSuccess2);

    }






} // end class
