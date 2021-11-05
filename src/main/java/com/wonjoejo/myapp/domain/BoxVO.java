package com.wonjoejo.myapp.domain;

import lombok.Data;
import lombok.Value;

import java.util.Date;

@Value
public class BoxVO {
    private Integer box_no;
    private String member_id;
    private Integer box_mode;
    private String box_name;
    private String box_memo;
    private String box_photo_name;
    private String box_photo_path;
    private Date reg_date;

    public BoxVO(Integer box_no, String member_id, Integer box_mode, String box_name, String box_memo, String box_photo_name, String box_photo_path, Date reg_date) {
        this.box_no = box_no;
        this.member_id = member_id;
        this.box_mode = box_mode;
        this.box_name = box_name;
        this.box_memo = box_memo;
        this.box_photo_name = box_photo_name;
        this.box_photo_path = box_photo_path;
        this.reg_date = reg_date;
    }
} // end class
