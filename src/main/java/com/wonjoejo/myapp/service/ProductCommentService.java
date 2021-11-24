package com.wonjoejo.myapp.service;

import com.wonjoejo.myapp.domain.Criteria;
import com.wonjoejo.myapp.domain.ProductCommentVO;

import java.util.List;

public interface ProductCommentService {

    // 댓글 리스트
    public abstract List<ProductCommentVO> getList(Integer product_no);

    // 댓글 수
    public abstract Integer getTotal(Integer product_no);

    // 댓글 생성
    public abstract Boolean createComment(ProductCommentVO comment);

    // 댓글 수정
    public abstract Boolean editComment(ProductCommentVO comment);

    // 댓글 삭제
    public abstract Boolean deleteComment(Integer comment_no);



} // end interface
