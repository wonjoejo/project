package com.wonjoejo.myapp.domain;

import lombok.Data;


@Data
public class PermissionVO { // 0:가능 1: 불가능 
	private Integer no; 
	private Integer box_no;
	private String member_id;
	private Integer master_per;
	private Integer write_per;
	private Integer read_per;
	private Integer edit_per;
	private Integer delete_per;
	private Integer member_stat; // 멤버 상태 
	
} //end class 
