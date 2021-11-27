package com.wonjoejo.myapp.domain;

import lombok.Value;

import java.util.Date;

@Value
public class ProductVO {
	private Integer product_no;
	private Integer box_no;
	private String product_name;
	private String product_memo;
	private Integer product_qtn;
	private String product_photo_name;
	private String product_photo_path;
	private String barcode;
	private Date reg_date;
	private Date update_date;


	public ProductVO(Integer product_no, Integer box_no, String product_name, String product_memo, Integer product_qtn,
					 String product_photo_name, String product_photo_path, String barcode, Date reg_date, Date update_date) {
		this.product_no = product_no;
		this.box_no = box_no;
		this.product_name = product_name;
		this.product_memo = product_memo;
		this.product_qtn = product_qtn;
		this.product_photo_name = product_photo_name;
		this.product_photo_path = product_photo_path;
		this.barcode = barcode;
		this.reg_date = reg_date;
		this.update_date = update_date;
	} // ProductVO constructor
    
} // end class
