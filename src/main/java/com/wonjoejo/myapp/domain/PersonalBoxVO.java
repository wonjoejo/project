package com.wonjoejo.myapp.domain;

import lombok.Value;

@Value
public class PersonalBoxVO {
	
	private Integer product_no;
	private String product_name;
	private Integer product_qtn;
	private String product_memo;
	private String product_photo_name;
	private String product_photo_path;

} // end class
