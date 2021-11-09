package com.wonjoejo.myapp.domain;

import lombok.Data;

import java.util.Date;


@Data
public class BoardDTO {

	private Integer board_idx;
    private String member_id;
    private String title;
    private String content;
    private Integer notice;

    private Integer ref;
    private Integer depth;
    private Integer step;

}//end class
