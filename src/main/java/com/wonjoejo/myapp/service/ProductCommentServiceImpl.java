package com.wonjoejo.myapp.service;


import com.wonjoejo.myapp.domain.Criteria;
import com.wonjoejo.myapp.domain.ProductCommentVO;
import com.wonjoejo.myapp.mapper.ProductCommentMapper;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Log4j2
@NoArgsConstructor

@Service
public class ProductCommentServiceImpl implements ProductCommentService, InitializingBean, DisposableBean {

    @Setter(onMethod_= {@Autowired})
    private ProductCommentMapper mapper;


    @Override
    public List<ProductCommentVO> getList(Integer product_no) {
        log.debug("getList() invoked.");

        List<ProductCommentVO> list = this.mapper.getList(product_no);
        list.forEach(log::info);

        return list;
    } // getList

    @Override
    public Integer getTotal(Integer product_no) {
        log.debug("getTotal() invoked.");

        return this.mapper.getTotalCount(product_no);
    } // getTotal

    @Override
    public Boolean createComment(ProductCommentVO comment) {
        log.debug("createComment({}) invoked." , comment);

        int affectedLines = this.mapper.insertComment(comment);

        return affectedLines == 1;
    } // createComment

    @Override
    public Boolean editComment(ProductCommentVO comment) {
        log.debug("editComment({}) invoked." , comment);

        int affectedLines = this.mapper.updateComment(comment);

        return affectedLines == 1;
    } // editComment

    @Override
    public Boolean deleteComment(Integer comment_no) {
        log.debug("deleteComment({}) invoked.", comment_no);

        int affectedLines = this.mapper.deleteComment(comment_no);

        return affectedLines == 1;
    } // deleteComment

    @Override
    public void destroy() throws Exception {

    } // destroy

    @Override
    public void afterPropertiesSet() throws Exception {

    } // afterPropertiesSet

} // end class
