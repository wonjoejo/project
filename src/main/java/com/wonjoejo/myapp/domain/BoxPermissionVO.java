package com.wonjoejo.myapp.domain;

import lombok.Value;

@Value
public class BoxPermissionVO {
	private Integer no; 
	private Integer box_no;
	private String member_id;
	private Integer master_per;
	private Integer write_per;
	private Integer read_per;
	private Integer edit_per;
	private Integer delete_per;
	private Integer member_stat;
}
