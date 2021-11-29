package com.wonjoejo.myapp.service;

import com.wonjoejo.myapp.domain.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductService {

	// box 번호로 해당되는 물품 리스트 조회
	public abstract List<ProductCategoryVO> getProductList(Integer box_no);

	// chart 수량 top 5
	public abstract List<ProductVO> getTopProductList(Integer box_no);

	// chart 최신 입고 물품
	public abstract List<ProductVO> getDateProductList(Integer box_no);

	// chart 오늘 등록된 물품 개수
	public abstract Integer getRegTotalCount(Integer box_no);

	// chart 오늘 수정된 물품 개수
	public abstract Integer getEditTotalCount(Integer box_no);

	// 물품 한건 상세보기
	public abstract ProductVO getProduct(Integer product_no);

	// 물품 작성
	public abstract Boolean insertProduct(ProductVO product);

	// 물품 수정
	public abstract Boolean editProduct(ProductVO product);

	// 물품 삭제
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


	// 물품 리스트 페이지처리
	public abstract List<ProductCategoryVO> getListPerPage(Criteria cri);

	//총 레코드 개수 반환 
	public abstract Integer getTotalCount(Integer box_no);

	// 물품 전체 검색
	public abstract List<ProductCategoryVO> searchProduct(@Param("keyword") String keyword, @Param("box_no") Integer box_no);

	// 바코드(QR) 생성
	public abstract Boolean createBarcode(@Param("product_no") Integer product_no, @Param("barcode") String barcode);
	
	// 회원 타입 조회(기업/일반)
	public abstract Boolean checkMemberType(@Param("box_no") Integer box_no, @Param("product_no")Integer product_no);
	
	// 댓글 삭제
	public abstract Boolean deleteProductComment(Integer product_no);

} // ProductService

