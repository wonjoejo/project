package com.wonjoejo.myapp.mapper;

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
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ProductCommentMapperTests {

    @Setter(onMethod_ = {@Autowired})
    private ProductCommentMapper mapper;

    @Before
    public void setup() {

        log.debug("setup() invoked.");

        assert this.mapper != null;
        log.info("\t+ mapper: {}", this.mapper);
        log.info("\t+ type: {}", this.mapper.getClass().getName());

    } // setup

    @Test
    public void testGetList(){
        log.debug("testGetList() invoked.");

        Integer product_no = 254;

        List<ProductCommentVO> list = this.mapper.getList(product_no);
        log.info("댓글댓글 : {}", list.get(0).getComment_content());
        list.forEach(log::info);

    } // testGetList

    @Test
    public void testInsert (){
        log.debug("testInsert() invoked.");

        ProductCommentVO comment = new ProductCommentVO(
                null,
                "wlgus",
                474,
                "test",
                null
        );

        this.mapper.insertComment(comment);
        log.info("\t+ comment: {}", comment);

    } // testInsert

    @Test
    public void testUpdate (){
        log.debug("testUpdate() invoked.");

        ProductCommentVO comment = new ProductCommentVO(
                344,
                "wlgus",
                474,
                "수정",
                null
        );

        int affectedLines = this.mapper.updateComment(comment);
        log.info("\t+ affectedLines: {}", affectedLines);

    } // testUpdate


    @Test
    public void testDelete (){
        log.debug("testDelete() invoked.");

        int comment_no = 343;
        int affectedLines = this.mapper.deleteComment(comment_no);

        log.info("\t+ affectedLines : {}" , affectedLines);

    } // testDelete







} // end class
