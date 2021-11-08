package com.wonjoejo.myapp.domain;

import lombok.Data;


@Data
public class BoardDTO {

	private Integer board_idx;
    private String member_id;
    private String title;
    private String content;
    private Integer notice;

}//end class
