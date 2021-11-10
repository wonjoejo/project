package com.wonjoejo.myapp.mapper;

import java.util.List;

import com.wonjoejo.myapp.domain.BaseCategoryVO;
import com.wonjoejo.myapp.domain.CategoryVO;
import com.wonjoejo.myapp.domain.ProductVO;

public interface ProductMapper {

	public abstract List<ProductVO> selectProductList(Integer box_no);

	public abstract ProductVO selectProduct(Integer product_no);

	public abstract Integer insertProduct(ProductVO product);

	public abstract Integer updateProduct(ProductVO product);

	public abstract Integer deleteProduct(Integer product_no);

	// category insert
	public abstract Integer insertCategory(CategoryVO category);

	// category update
	public abstract Integer updateCategory(CategoryVO category);

	// category detail
	public abstract CategoryVO selectCategory(Integer product_no);

	// baseCategory detail
	public abstract BaseCategoryVO selectBaseCategory(Integer box_no);



} // end interface
