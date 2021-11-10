package com.wonjoejo.myapp.service;

import java.util.List;

import com.wonjoejo.myapp.domain.CategoryVO;
import lombok.Setter;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wonjoejo.myapp.domain.BoxVO;
import com.wonjoejo.myapp.domain.ProductVO;
import com.wonjoejo.myapp.mapper.ProductMapper;

import lombok.AllArgsConstructor;
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
	public List<ProductVO> getProductList(Integer box_no) {
		log.debug("getProductList() invoked.");

		List<ProductVO> list = this.mapper.selectProductList(box_no);

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
	public boolean insertProduct(ProductVO product) {
		log.debug("createProduct({}) invoked", product);

		int affectedLines = this.mapper.insertProduct(product);

		return affectedLines == 1;
	} // insertProduct
	

	@Override
	public boolean editProduct(ProductVO product) {
		log.debug("editProduct({}) invoked", product);

		int affectedLines = this.mapper.updateProduct(product);

		return affectedLines == 1;
	} // editProduct

	
	@Override
	public boolean deleteProduct(Integer product_no) {
		log.debug("deleteProduct({}) invoked",product_no);

		int affectedLines = this.mapper.deleteProduct(product_no);

		return affectedLines == 1;
	} // deleteProduct


	// category insert
	@Override
	public boolean insertCategory(CategoryVO category) {
		log.debug("insertCategory({}) invoked.", category);

		int affectedLines = this.mapper.insertCategory(category);

		return affectedLines == 1;
	} // end insertCategory





} // end class
