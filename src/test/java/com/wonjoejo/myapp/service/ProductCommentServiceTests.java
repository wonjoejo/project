package com.wonjoejo.myapp.service;

import com.wonjoejo.myapp.domain.*;
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
public class ProductCommentServiceTests {

    @Setter(onMethod_= { @Autowired})
    private ProductCommentService service;

    @Before
    public void setUp() {
        log.debug("setup() invoked.");

        assert this.service != null;
        log.info("\t+ service: {}",this.service);

    } // setup

    @Test(timeout = 1000)
    public void testGetList(){
        log.debug("testGetList() invoked.");

        Integer product_no = 254;

        List<ProductCommentVO> list = this.service.getList(product_no);

        assert list != null;
        list.forEach(log::info);

    } // testGetList

    @Test(timeout = 1000)
    public void testGetTotal(){
        log.debug("testGetTotal() invoked.");

        Integer product_no = 254;
        int totalCount = this.service.getTotal(product_no);
        log.info("\t+ TotalCount: {}", totalCount);

    } // testGetTotal

    @Test(timeout = 1000)
    public void testInsert(){
        log.debug("testInsert() invoked.");

        ProductCommentVO comment = new ProductCommentVO(
                null,
                "wlgus",
                474,
                "댓글댓글",
                null
        );

        boolean isSuccess = this.service.createComment(comment);
        log.info("\t+ isSuccess : {} ", isSuccess);

    } // testInsert

    @Test(timeout = 1000)
    public void testUpdate(){
        log.debug("testUpdate() invoked.");

        ProductCommentVO comment = new ProductCommentVO(
                347,
                "wlgus",
                474,
                "댓글댓글 수정",
                null
        );

        boolean isSuccess = this.service.editComment(comment);
        log.info("\t+ isSuccess : {} ", isSuccess);

    } // testUpdate

    @Test(timeout = 1000)
    public void testDelete(){
        log.debug("testDelete() invoked.");

        Integer comment_no = 347;

        boolean isSuccess = this.service.deleteComment(comment_no);
        log.info("\t+ isSuccess : {} ", isSuccess);

    } // testDelete

} // end class
