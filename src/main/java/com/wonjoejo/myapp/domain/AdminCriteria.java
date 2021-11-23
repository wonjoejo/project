package com.wonjoejo.myapp.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter

@Data //DTO 
public class AdminCriteria {

	//페이지 기준정보
	
	//1.현재 보고자 하는 페이지 번호 
	private Integer currPage=1;
	//2.한 페이지당 보여줄 레코드 개수 
	private Integer amount=5;
	//3.한 페이지당 보여줄 페이지 번호 목록의 길이 
	private Integer pagesPerPage=5;

	// 멤버 ID
	private String member_id;

	//검색 추가 내용 
	private String keyword;
	
	public AdminCriteria() {	}
	
	public AdminCriteria(Integer currPage, Integer amount, Integer pagesPerPage,String keyword) {
		this.currPage = currPage;
		this.amount = amount;
		this.pagesPerPage = pagesPerPage;
		this.keyword = keyword;
		
	}
	
}//end class 
