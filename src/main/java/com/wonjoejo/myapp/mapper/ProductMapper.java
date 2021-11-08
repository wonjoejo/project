package com.wonjoejo.myapp.mapper;

import java.util.List;

import com.wonjoejo.myapp.domain.ProductDTO;
import com.wonjoejo.myapp.domain.ProductVO;

public interface ProductMapper {

	public abstract List<ProductVO> selectProductList(Integer box_no);
	// 물품 리스트 (박스번호로 조회)

	public abstract ProductVO selectProduct(Integer product_no);
	// 물품 상세보기 (물품번호로 조회)

	public abstract int insertProduct(ProductDTO product);

	public abstract int updateProduct(ProductVO product);

	public abstract int deleteProduct(Integer product_no);

} // end interface
