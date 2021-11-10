package com.wonjoejo.myapp.domain;

import lombok.Data;


@Data
public class LoginDTO {
	
	private String member_id;
	private String password;
	private Boolean rememberMe;
	
} // end class
