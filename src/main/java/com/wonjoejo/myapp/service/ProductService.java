package com.wonjoejo.myapp.service;

import java.util.List;

import com.wonjoejo.myapp.domain.BaseCategoryVO;
import com.wonjoejo.myapp.domain.BoxVO;
import com.wonjoejo.myapp.domain.CategoryVO;
import com.wonjoejo.myapp.domain.ProductVO;

public interface ProductService {

	public abstract List<ProductVO> getProductList(Integer box_no);
	// box 번호로 해당되는 물품 리스트 조회

	public abstract ProductVO getProduct(Integer product_no);

	public abstract Boolean insertProduct(ProductVO product);

	public abstract Boolean editProduct(ProductVO product);

	public abstract Boolean deleteProduct(Integer product_no);

	// Category 생성
	public abstract Boolean insertCategory(CategoryVO category);

	// Category 수정
	public abstract Boolean editCategory(CategoryVO category);

	// Category 상세보기
	public abstract CategoryVO getCategory(Integer product_no);

	// Category 삭제
	public abstract Boolean deleteCategory(Integer product_no);

	// BaseCategory 상세보기
	public abstract BaseCategoryVO getBaseCategory(Integer box_no);




} // ProductService

