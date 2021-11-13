package com.wonjoejo.myapp.mapper;

import java.util.List;

import com.wonjoejo.myapp.domain.BaseCategoryVO;
import com.wonjoejo.myapp.domain.CategoryVO;
import com.wonjoejo.myapp.domain.Criteria;
import com.wonjoejo.myapp.domain.ProductVO;

public interface ProductMapper {

	// 물품 리스트 조회
	public abstract List<ProductVO> selectProductList(Integer box_no);

	// 물품 상세 조회
	public abstract ProductVO selectProduct(Integer product_no);

	// 물품 작성
	public abstract Integer insertProduct(ProductVO product);

	// 물품 수정
	public abstract Integer updateProduct(ProductVO product);

	// 물품 삭제
	public abstract Integer deleteProduct(Integer product_no);

	// category 생성
	public abstract Integer insertCategory(CategoryVO category);

	// category 수정
	public abstract Integer updateCategory(CategoryVO category);

	// category 상세보기
	public abstract CategoryVO selectCategory(Integer product_no);

	// category 삭제
	public abstract Integer deleteCategory(Integer product_no);

	// baseCategory 상세보기
	public abstract BaseCategoryVO selectBaseCategory(Integer box_no);
	
    // 페이징 처리된 물품 리스트 조회
    public abstract List<ProductVO> getListPaging(Criteria cri);

	//총 물품 개수 반환 
	public abstract Integer getTotalCount(Integer box_no);




} // end interface


