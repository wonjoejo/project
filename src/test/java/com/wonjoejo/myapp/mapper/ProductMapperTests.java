package com.wonjoejo.myapp.mapper;

import java.util.List;

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
	
	@Test
	public void testGetBoxList() {

		log.debug("testGetBoxList() invoked.");

		Integer box_no = 1005;

		List<ProductVO> list = this.mapper.selectProductList(box_no);
		log.info("으이잉" + list.get(0).getProduct_memo());
		list.forEach(log::info);
		


	} // testGetPersonalList

}
