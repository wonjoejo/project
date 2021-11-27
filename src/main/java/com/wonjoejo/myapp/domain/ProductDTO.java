package com.wonjoejo.myapp.domain;

import lombok.Data;

import java.util.Date;

@Data
public class ProductDTO {
    private Integer product_no;
    private Integer box_no;
    private String product_name;
    private String product_memo;
    private Integer product_qtn;
    private String product_photo_name;
    private String product_photo_path;
    private String barcode;
    private Date reg_date;
    private Date update_date;

} // end class
