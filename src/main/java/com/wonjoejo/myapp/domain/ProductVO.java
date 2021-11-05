package com.wonjoejo.myapp.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {
    private Integer product_no;
    private Integer box_no;
    private String product_name;
    private String product_memo;
    private Integer product_qtn;
    private String product_photo_name;
    private String product_photo_path;
    private Integer barcode;
    private Date reg_date;
    
    
} // end class