package com.wonjoejo.myapp.domain;

import lombok.Data;

import java.util.Date;

@Data
public class MemberDTO {
    private String member_id;
    private Integer member_type;
    private Integer member_status;
    private String name;
    private String password;
    private String email;
    private String phone_number;
    private String photo_name;
    private String photo_path;
    private String company_name;
    private Date reg_date;
    private String rememberMe;
    private Date rememberAge;

} // end class
