package com.wonjoejo.myapp.domain;


import lombok.Value;



@Value
public class BoxPermissionBoxVO {
    private Integer box_no;
    private Integer box_status;
    private String member_id;
    private Integer no;
    private Integer master_per;

    public BoxPermissionBoxVO(Integer box_no, Integer box_status, String member_id, Integer no, Integer master_per) {
        this.box_no = box_no;
        this.box_status = box_status;
        this.member_id = member_id;
        this.no = no;
        this.master_per = master_per;
    } // constructor

}// end class
