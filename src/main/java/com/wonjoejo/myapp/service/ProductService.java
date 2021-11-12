package com.wonjoejo.myapp.service;

import java.util.List;

import com.wonjoejo.myapp.domain.BaseCategoryVO;
import com.wonjoejo.myapp.domain.BoxVO;
import com.wonjoejo.myapp.domain.CategoryVO;
import com.wonjoejo.myapp.domain.Criteria;
import com.wonjoejo.myapp.domain.ProductVO;

public interface ProductService {

	// box 번호로 해당되는 물품 리스트 조회
	public abstract List<ProductVO> getProductList(Integer box_no);
	
    // 물품 한건 상세보기
	public abstract ProductVO getProduct(Integer product_no);

	// 물품 작성
	public abstract Boolean insertProduct(ProductVO product);

	// 물품 수정
	public abstract Boolean editProduct(ProductVO product);

	// 물품 삭제
	public abstract Boolean deleteProduct(Integer product_no);

	// Category insert
	public abstract Boolean insertCategory(CategoryVO category);

	// Category 수정
	public abstract Boolean editCategory(CategoryVO category);

	// Category detail
	public abstract CategoryVO getCategory(Integer product_no);

	// BaseCategory detail
	public abstract BaseCategoryVO getBaseCategory(Integer box_no);
	
	

    // 물품 리스트 페이지처리
    public abstract List<ProductVO> getListPerPage(Criteria cri);

	//총 레코드 개수 반환 
	public abstract Integer getTotal();



} // ProductService

