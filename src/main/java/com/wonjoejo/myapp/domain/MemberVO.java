package com.wonjoejo.myapp.domain;

import java.util.Date;

import lombok.Value;

@Value
public class MemberVO {
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
	
    public MemberVO(String member_id, Integer member_type, Integer member_status, String name, String password,
			String email, String phone_number, String photo_name, String photo_path, String company_name,
			Date reg_date) {
		super();
		this.member_id = member_id;
		this.member_type = member_type;
		this.member_status = member_status;
		this.name = name;
		this.password = password;
		this.email = email;
		this.phone_number = phone_number;
		this.photo_name = photo_name;
		this.photo_path = photo_path;
		this.company_name = company_name;
		this.reg_date = reg_date;
	}
    
    
} // end class
