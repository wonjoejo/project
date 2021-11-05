package com.wonjoejo.myapp.domain;

import lombok.Value;

import java.util.Date;


@Value
public class BoardVO {

    private String id;
    private String title;
    private String content;
    private Integer notice;

    private Date reg_date;
    private Integer ref;
    private Integer depth;
    private Integer step;

}//end class
