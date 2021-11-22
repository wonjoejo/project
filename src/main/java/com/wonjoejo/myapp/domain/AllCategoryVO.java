package com.wonjoejo.myapp.domain;


import lombok.Value;

@Value
public class AllCategoryVO {

    // baseCategory
    private Integer category_no;
    private String cate_name1;
    private String cate_name2;
    private String cate_name3;
    private String cate_name4;
    private String cate_name5;
    private Integer box_no;

    // category
    private String cate_detail1;
    private String cate_detail2;
    private String cate_detail3;
    private String cate_detail4;
    private String cate_detail5;

    public AllCategoryVO(Integer category_no, String cate_name1, String cate_name2, String cate_name3, String cate_name4, String cate_name5, Integer box_no, String cate_detail1, String cate_detail2, String cate_detail3, String cate_detail4, String cate_detail5) {
        this.category_no = category_no;
        this.cate_name1 = cate_name1;
        this.cate_name2 = cate_name2;
        this.cate_name3 = cate_name3;
        this.cate_name4 = cate_name4;
        this.cate_name5 = cate_name5;
        this.box_no = box_no;
        this.cate_detail1 = cate_detail1;
        this.cate_detail2 = cate_detail2;
        this.cate_detail3 = cate_detail3;
        this.cate_detail4 = cate_detail4;
        this.cate_detail5 = cate_detail5;
    } // end constructor

} // end class
