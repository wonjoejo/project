package com.wonjoejo.myapp.domain;

import lombok.Data;

import java.util.Date;

@Data
public class BoxVO {
    private Integer box_no;
    private String user_id;
    private String box_mode;
    private String box_name;
    private String box_memo;
    private String box_photo_name;
    private String box_photo_path;
    private Date reg_date;
} // end class
