package com.wonjoejo.myapp.service;

import java.util.List;

import com.wonjoejo.myapp.domain.BoxVO;
import com.wonjoejo.myapp.domain.CategoryVO;
import com.wonjoejo.myapp.domain.ProductVO;

public interface ProductService {

	public abstract List<ProductVO> getProductList(Integer box_no);
	// box 번호로 해당되는 물품 리스트 조회

	public abstract ProductVO getProduct(Integer product_no);

	public abstract boolean insertProduct(ProductVO product);

	public abstract boolean editProduct(ProductVO product);

	public abstract boolean deleteProduct(Integer product_no);

	// Category insert
	public abstract boolean insertCategory(CategoryVO category);

} // ProductService
