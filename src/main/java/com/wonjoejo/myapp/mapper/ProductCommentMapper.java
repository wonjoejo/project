package com.wonjoejo.myapp.mapper;

import com.wonjoejo.myapp.domain.Criteria;
import com.wonjoejo.myapp.domain.ProductCommentVO;

import java.util.List;

public interface ProductCommentMapper {

    // 리스트
    public abstract List<ProductCommentVO> getList(Integer product_no);

    // 댓글 전체 수
    public abstract Integer getTotalCount(Integer product_no);

    // 댓글 쓰기
    public abstract Integer insertComment(ProductCommentVO comment);

    // 댓글 수정
    public abstract Integer updateComment(ProductCommentVO comment);

    // 댓글 삭제
    public  abstract Integer deleteComment(Integer comment_no);


} // end interface
