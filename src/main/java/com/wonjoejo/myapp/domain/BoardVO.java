package com.wonjoejo.myapp.domain;

import lombok.Value;

import java.util.Date;


@Value
public class BoardVO {

	private Integer board_idx;
    private String member_id;
    private String title;
    private String content;
    private Integer notice;

    private Date reg_date;
    
    private Integer ref;
    private Integer depth;
    private Integer step;
    
	public BoardVO(Integer board_idx, String member_id, String title, String content, Integer notice, Date reg_date,
			Integer ref, Integer depth, Integer step) {
		super();
		this.board_idx = board_idx;
		this.member_id = member_id;
		this.title = title;
		this.content = content;
		this.notice = notice;
		this.reg_date = reg_date;
		this.ref = ref;
		this.depth = depth;
		this.step = step;
	}
    
    

}//end class
