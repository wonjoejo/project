package com.wonjoejo.myapp.domain;

import lombok.Data;

import java.util.Date;

@Data
public class BoxDTO {
    private Integer box_no;
    private String member_id;
    private Integer box_mode;
    private String box_name;
    private String box_memo;
    private String box_photo_name;
    private String box_photo_path;
    private Date reg_date;
}
