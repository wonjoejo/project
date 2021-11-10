package com.wonjoejo.myapp.service;

import com.wonjoejo.myapp.domain.BoxVO;
import com.wonjoejo.myapp.domain.CategoryVO;
import com.wonjoejo.myapp.domain.ProductVO;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@Log4j2
@NoArgsConstructor

@RunWith(SpringRunner.class)
@ContextConfiguration(
        {
                "file:src/main/webapp/WEB-INF/spring/root-context.xml",
                "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
        }
)
public class ProductServiceTests {

    @Setter(onMethod_= { @Autowired})
    private ProductService service;

    @Before
    public void setUp() {

        log.debug("setup() invoked.");

        assert this.service != null;
        log.info("\t+ service: {}",this.service);

    } // setup

    
    @Test(timeout=1000)
    public void testGetBoxList() {
    	log.debug("testProductxList() invoked.");

		Integer box_no = 1005;

		List<ProductVO> list = this.service.getProductList(box_no);
		log.info("{} 박스 물품 리스트: ", box_no + list.get(0).getProduct_memo());
		list.forEach(log::info);

    } // testGetBoxList
    

    @Test(timeout=1000)
    public void testProductDetail() {

        log.debug("testProductDetail() invoked.");

        Integer product_no = 6;
		ProductVO product = this.service.getProduct(product_no);
		log.info("{}번 물품 조회: ", product_no, product.getProduct_name());

        assert product != null;
        log.info("\t+ product: {}",product);

    } // testProductDetail
    
    

    @Test(timeout=1000)
    public void testProductInsert() {
        log.debug("testProductInsert() invoked.");

		Integer box_no = 1339;
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

        boolean isSuccess = this.service.insertProduct(product);
        log.info("Product created successfully: {}",isSuccess);

        // category insert

        CategoryVO category = new CategoryVO(
                null,
                null,
                product.getProduct_no(),
                "빨간색",
                "Small",
                null,
                null,
                null
        );

        boolean isSuccess2 = this.service.insertCategory(category);
        log.info("Category inserted Successfully: {}", isSuccess2) ;


    } // testProductInsert
    
    

    @Test(timeout=1000)
    public void testProductEdit() {
        log.debug("testProductEdit() invoked");

		Integer product_no = 302;
		Integer box_no = null;
		String product_name = "update_test12345";
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

        boolean isSuccess = this.service.editProduct(product);
        log.info("product edited successfully: {}",isSuccess);
    } // testProductEdit
    
    

    @Test(timeout=1000)
    public void testProductDelete() {
        log.debug("testProductDelete() invoked.");

        Integer product_no = 316;
        boolean isSuccess = this.service.deleteProduct(product_no);

        log.info("Product deleted successfully: {}",isSuccess);
    } // testProductDelete
    

} // end class
