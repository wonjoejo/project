package com.wonjoejo.myapp.domain;


import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Value;

import java.util.Date;

@Value
public class ProductCommentVO {

    private Integer comment_no;
    private String member_id;
    private Integer product_no;
    private String comment_content;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
    private Date reg_date;

    public ProductCommentVO(Integer comment_no, String member_id, Integer product_no, String comment_content, Date reg_date) {
        this.comment_no = comment_no;
        this.member_id = member_id;
        this.product_no = product_no;
        this.comment_content = comment_content;
        this.reg_date = reg_date;
    }
} // end class
