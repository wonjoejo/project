package com.wonjoejo.myapp.service;

import java.util.List;

import com.wonjoejo.myapp.domain.*;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wonjoejo.myapp.mapper.ProductMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@AllArgsConstructor

@Service
public class ProductServiceImpl implements ProductService, InitializingBean, DisposableBean {

	@Setter(onMethod_= { @Autowired})
	private ProductMapper mapper;

	@Override
	public void destroy() throws Exception {
		
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		
	}


	@Override
	public List<ProductCategoryVO> getProductList(Integer box_no) {
		log.debug("getProductList() invoked.");

		List<ProductCategoryVO> list = this.mapper.selectProductList(box_no);

		list.forEach(log::info);

		return list;
	} // getProductList
	

	@Override
	public ProductVO getProduct(Integer product_no) {
		log.debug("getProduct({}) invoked.", product_no);

		ProductVO product = this.mapper.selectProduct(product_no);

		log.info(product);

		return product;
	} // getProduct
	

	@Override
	public Boolean insertProduct(ProductVO product) {
		log.debug("createProduct({}) invoked", product);

		int affectedLines = this.mapper.insertProduct(product);

		return affectedLines == 1;
	} // insertProduct
	

	@Override
	public Boolean editProduct(ProductVO product) {
		log.debug("editProduct({}) invoked", product);

		int affectedLines = this.mapper.updateProduct(product);

		return affectedLines == 1;
	} // editProduct

	
	@Override
	public Boolean deleteProduct(Integer product_no) {
		log.debug("deleteProduct({}) invoked",product_no);

		int affectedLines = this.mapper.deleteProduct(product_no);

		return affectedLines == 1;
	} // deleteProduct


	// category insert
	@Override
	public Boolean insertCategory(CategoryVO category) {
		log.debug("insertCategory({}) invoked.", category);

		int affectedLines = this.mapper.insertCategory(category);

		return affectedLines == 1;
	} // end insertCategory

	// category 수정
	@Override
	public Boolean editCategory(CategoryVO category) {
		log.debug("editCategory({}) invoked.",category);

		int affectedLines = this.mapper.updateCategory(category);

		return affectedLines == 1;
	} // end editCategory

	// Category Detail
	@Override
	public CategoryVO getCategory(Integer product_no) {
		log.debug("getCategory({}) invoked.", product_no);

		CategoryVO category = this.mapper.selectCategory(product_no);
		log.info("\t+ category: {}" , category);

		return category;
	} // end getCategory

	// BaseCategory Detail
	@Override
	public BaseCategoryVO getBaseCategory(Integer box_no) {
		log.debug("getBaseCategory({}) invoked.", box_no);

		BaseCategoryVO baseCategory = this.mapper.selectBaseCategory(box_no);
		log.info("\t+ baseCategory: {}" , baseCategory);

		return baseCategory;
	} // end getBaseCategory

	
	
	@Override
	public List<ProductCategoryVO> getListPerPage(Criteria cri) {
		log.debug("getListPerPage({}) invoked.",cri);
		

		List<ProductCategoryVO> list = this.mapper.getListPaging(cri);

		list.forEach(log::info);

		log.info("\t+ list size:{} ",list.size());
		
		return list;
	} // getListPerPage
	
	

	@Override
	public Integer getTotalCount(Integer box_no) {
		log.debug("getTotal() invoked.");
		
		return this.mapper.getTotalCount(box_no);
	} // getTotalCount

	
	@Override
	public Boolean deleteCategory(Integer product_no) {
		return null;
	} // deleteCategory





} // end class
