package com.wonjoejo.myapp.domain;


import lombok.Value;

@Value
public class DeleteCategoryVO {

    private Integer category_no;
    private String cate_detail1;
    private String cate_detail2;
    private String cate_detail3;
    private String cate_detail4;
    private String cate_detail5;

    public DeleteCategoryVO(Integer category_no, String cate_detail1, String cate_detail2, String cate_detail3, String cate_detail4, String cate_detail5) {
        this.category_no = category_no;
        this.cate_detail1 = cate_detail1;
        this.cate_detail2 = cate_detail2;
        this.cate_detail3 = cate_detail3;
        this.cate_detail4 = cate_detail4;
        this.cate_detail5 = cate_detail5;
    }
} // AllCategoryVO
