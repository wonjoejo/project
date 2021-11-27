package com.wonjoejo.myapp.mapper;

import com.wonjoejo.myapp.domain.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductMapper {

	// 물품 리스트 조회
	public abstract List<ProductCategoryVO> selectProductList(Integer box_no);

	// CHART 수량 TOP 5
	public abstract List<ProductVO> selectProductTop(Integer box_no);

	// CHART 수량 TOP 5
	public abstract List<ProductVO> selectProductDate(Integer box_no);

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
	public abstract List<ProductCategoryVO> getListPaging(Criteria cri);

	//총 물품 개수 반환 
	public abstract Integer getTotalCount(Integer box_no);

	//물품 전체 검색
	public abstract List<ProductCategoryVO> searchProduct(@Param("keyword") String keyword, @Param("box_no") Integer box_no);

	//바코드 생성
	public abstract Integer updateBarcode(@Param("product_no") Integer product_no, @Param("barcode") String barcode);


} // end interface


