package com.wonjoejo.myapp.mapper;

import java.util.List;

import com.wonjoejo.myapp.domain.CategoryVO;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.wonjoejo.myapp.domain.ProductVO;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ProductMapperTests {
	
	@Setter(onMethod_= { @Autowired })
	private ProductMapper mapper;
	
	
	@Before
	public void setup() {
		
		log.debug("setup() invoked.");
		
		assert this.mapper != null;
		log.info("\t+ mapper: {}", this.mapper);
		log.info("\t+ type: {}", this.mapper.getClass().getName());
		
	} // setup
	
	
	@Test	// box 번호를 기준으로 그 박스의 물품 리스트 조회
	public void testProductxList() {
		log.debug("testProductxList() invoked.");

		Integer box_no = 1005;

		List<ProductVO> list = this.mapper.selectProductList(box_no);
		log.info("{} 박스 물품 리스트: ", box_no + list.get(0).getProduct_memo());
		list.forEach(log::info);

	} // testProductxList
	
	
	@Test	// 물품 번호를 기준으로 물품 정보 조회
	public void testProductDetail() {
		log.debug("testProductxList() invoked.");
		
		Integer product_no = 6;
		
		ProductVO product = this.mapper.selectProduct(product_no);
		log.info("{}번 물품 조회: ", product_no, product.getProduct_name());
		
	} // testProductDetail
	
	
	@Test	// INSERT
	public void testProductInsert() {
		log.debug("testProductInsert() invoked.");
		

		Integer box_no = 1311;
		String product_name = "productInsert";
		String product_memo = "productMemo";
		Integer product_qtn = 2;
		
		ProductVO product = new ProductVO(
				null,
				box_no,
				product_name,
				product_memo,
				product_qtn,
				null, null, null, null				
				);
		
		this.mapper.insertProduct(product);

		CategoryVO category = new CategoryVO(
				null,
				null,
				product.getProduct_no(),
				"detail",
				"detail",
				null,
				null,
				null
		);

		this.mapper.insertCategory(category);

		log.info("\t+ product: {}",product);
		log.info("\t+ category: {}",category);
		
	} // testProductInsert
	
	
	@Test	// UPDATE
	public void testProductEdit() {
		log.debug("testProductEdit() invoked.");
		
		Integer product_no = 302;
		Integer box_no = null;
		String product_name = "update_test";
		String product_memo = "productMemo";
		Integer product_qtn = 100;
		
		ProductVO product = new ProductVO(
				product_no, 
				box_no,
				product_name,
				product_memo,
				product_qtn,
				null, null, null, null				
				);
		
		this.mapper.updateProduct(product);
		log.info("\t+ product: {}",product);
		
	} // testProductEdit
	
	
	@Test	// DELETE
	public void testProductDelete() {
		log.debug("testProductDelete() invoked.");
		
		Integer product_no = 315;
		this.mapper.deleteProduct(product_no);
		
	} // testProductDelete
	
	

} // end class
