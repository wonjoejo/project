package com.wonjoejo.myapp.domain;


import lombok.Value;

import java.util.Date;

@Value
public class ProductCategoryVO {
    // Product
    private Integer product_no;
    private Integer box_no;
    private String product_name;
    private String product_memo;
    private Integer product_qtn;
    private String product_photo_name;
    private String product_photo_path;
    private Integer barcode;
    private Date reg_date;

    // Base Category
    private Integer category_no;
    private String cate_name1;
    private String cate_name2;
    private String cate_name3;
    private String cate_name4;
    private String cate_name5;

    // Category
    private String cate_detail1;
    private String cate_detail2;
    private String cate_detail3;
    private String cate_detail4;
    private String cate_detail5;

} // end class
