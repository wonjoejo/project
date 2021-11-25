package com.wonjoejo.myapp.domain;

import lombok.Data;

import java.util.Date;

@Data
public class ProductCommentDTO {

    private Integer comment_no;
    private String member_id;
    private Integer product_no;
    private String comment_content;
    private Date reg_date;

} // end class

