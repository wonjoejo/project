package com.wonjoejo.myapp.domain;

import lombok.Value;

@Value
public class MemberTypeVO {
	private Integer box_no;
	private String member_id;
	private Integer member_type;

	public MemberTypeVO(Integer box_no, String member_id, Integer member_type) {
		super();
		this.box_no = box_no;
		this.member_id = member_id;
		this.member_type = member_type;
	} // constructor

	// type 확인용

} // end class
