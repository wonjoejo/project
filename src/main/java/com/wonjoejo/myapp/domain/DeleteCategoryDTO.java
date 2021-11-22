package com.wonjoejo.myapp.domain;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

@Data
public class DeleteCategoryDTO {
    private Integer category_no;
    private String cate_detail1;
    private String cate_detail2;
    private String cate_detail3;
    private String cate_detail4;
    private String cate_detail5;
} // end class
