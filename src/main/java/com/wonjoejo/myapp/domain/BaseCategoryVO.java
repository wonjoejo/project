package com.wonjoejo.myapp.domain;


import lombok.Value;


@Value
public class BaseCategoryVO {
    private Integer box_no;
    private Integer category_no;
    private Integer product_no;
    private String cate_name1;
    private String cate_name2;
    private String cate_name3;
    private String cate_name4;
    private String cate_name5;

    public BaseCategoryVO(Integer box_no, Integer category_no, Integer product_no, String cate_name1, String cate_name2, String cate_name3, String cate_name4, String cate_name5) {
        this.box_no = box_no;
        this.category_no = category_no;
        this.product_no = product_no;
        this.cate_name1 = cate_name1;
        this.cate_name2 = cate_name2;
        this.cate_name3 = cate_name3;
        this.cate_name4 = cate_name4;
        this.cate_name5 = cate_name5;
    } // constructor

} // end class
