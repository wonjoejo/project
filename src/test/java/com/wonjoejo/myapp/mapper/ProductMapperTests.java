package com.wonjoejo.myapp.mapper;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.wonjoejo.myapp.domain.ProductDTO;
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
	
	@Test	// 물품 리스트 조회(박스 번호로 한 박스 조회)
	public void testGetList() {

		log.debug("testGetList() invoked.");

		Integer box_no = 1005;

		List<ProductVO> list = this.mapper.selectProductList(box_no);
		log.info("으이잉" + list.get(0).getProduct_memo());
		list.forEach(log::info);

	} // testGetList
	
	
	@Test
	public void testDetail() {

		log.debug("testDetail() invoked.");

		Integer product_no = 6;

		ProductVO pv = this.mapper.selectProduct(product_no);
		log.info("으이잉" + pv.getProduct_name());

	} // testDetail
	
	
	@Test
	public void testDelete() {
		log.debug("testDelete() invoked.");
		Integer product_no = 304;
		this.mapper.deleteProduct(product_no);

	} // testDelete
	
	
	
	
	@Test
	public void testInsert() {
		log.debug("testInsert() invoked.");
		
		ProductVO product = new ProductVO(
				1005,
				"productInsert",
				"memoInsert",
				2,
				"",
				"",
				0);

		this.mapper.insertProduct(pdto);
		
		log.info("으이잉" + pdto.getProduct_name());

	} // testInsert
	
	
	@Test
	public void testEdit() {
		log.debug("testEdit() invoked.");
		
		ProductVO product = new ProductVO(
				300,
				1005,
				"update_product",
				"memo_update",
				25, "", "", 0, null
				);
		
		this.mapper.updateProduct(product);
		
		log.info("\t+ product: {}", product);
	} // testEdit

}
