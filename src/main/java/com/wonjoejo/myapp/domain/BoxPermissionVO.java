package com.wonjoejo.myapp.domain;

import lombok.Value;

@Value
public class BoxPermissionVO {
	private Integer no; 
	private String member_id;
	private Integer box_no;
	private Integer master_per;
	private Integer write_per;
	private Integer read_per;
	private Integer edit_per;
	private Integer delete_per;
	private Integer member_stat;
	
	
	public BoxPermissionVO(Integer no, String member_id, Integer box_no, Integer master_per, Integer write_per,
			Integer read_per, Integer edit_per, Integer delete_per, Integer member_stat) {
		super();
		this.no = no;
		this.member_id = member_id;
		this.box_no = box_no;
		this.master_per = master_per;
		this.write_per = write_per;
		this.read_per = read_per;
		this.edit_per = edit_per;
		this.delete_per = delete_per;
		this.member_stat = member_stat;
	} // constructor

} //end class
