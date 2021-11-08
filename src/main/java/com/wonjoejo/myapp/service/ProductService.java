package com.wonjoejo.myapp.service;

import java.util.List;

import com.wonjoejo.myapp.domain.ProductDTO;
import com.wonjoejo.myapp.domain.ProductVO;

public interface ProductService {

	public abstract List<ProductVO> getProductList(Integer box_no);
	// box 번호로 해당되는 물품 리스트 조회

	public abstract ProductVO getProductDetail(Integer product_no);

	public abstract boolean insertProduct(ProductDTO product);

	public abstract boolean updateProduct(ProductVO product);

	public abstract boolean deleteProduct(Integer product_no);


} // ProductService
