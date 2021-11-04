package com.wonjoejo.myapp.domain;

import lombok.Data;

import java.util.Date;

@Data
public class UserVO {
    private String user_id;
    private Integer user_type;
    private Integer user_status;
    private String name;
    private String password;
    private String email;
    private Integer phone_number;
    private String photo_name;
    private String photo_path;
    private String company_name;
    private Date reg_date;

} // end class
