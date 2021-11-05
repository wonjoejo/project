package com.wonjoejo.myapp.domain;

import lombok.Data;


@Data
public class BoardDTO {

    private String id;
    private String title;
    private String content;
    private Integer notice;

}//end class
