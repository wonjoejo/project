package com.wonjoejo.myapp.service;


import com.wonjoejo.myapp.domain.*;
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

    
    @Test(timeout=1000)	// 해당 박스번호로 물품 리스트 조회
    public void testGetBoxList() {
    	log.debug("testProductxList() invoked.");

		Integer box_no = 1330;

		List<ProductCategoryVO> list = this.service.getProductList(box_no);
		log.info("{} 박스 물품 리스트: ", box_no + list.get(0).getProduct_memo());
		list.forEach(log::info);

    } // testGetBoxList
    

    @Test(timeout=1000)	// 해당 물품번호의 물품 상세조회
    public void testProductDetail() {

        log.debug("testProductDetail() invoked.");

        Integer product_no = 352;
		ProductVO product = this.service.getProduct(product_no);
		log.info("{}번 물품 조회: ", product_no, product.getProduct_name());

        assert product != null;
        log.info("\t+ product: {}",product);

        // Category Detail
        CategoryVO category = this.service.getCategory(product_no);
        assert category != null;
        log.info("\t+ Category: {}", category);

        // BaseCategory Detail
        Integer box_no = 1331;
        BaseCategoryVO baseCategory = this.service.getBaseCategory(box_no);
        assert baseCategory != null;
        log.info("\t+ baseCategory : {}", baseCategory);

    } // testProductDetail
    
    

    @Test(timeout=1000)	// 해당 정보로 물품 등록
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
                null, null, null, null, null);

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
    
    

    @Test(timeout=1000)	// 해당 물품번호의 물품 정보 수정
    public void testProductEdit() {
        log.debug("testProductEdit() invoked");

        Integer product_no = 358;
        Integer box_no = null;
        String product_name = "지현edit";
        String product_memo = "edit";
        Integer product_qtn = 100;

        ProductVO product = new ProductVO(
                product_no,
                box_no,
                product_name,
                product_memo,
                product_qtn,
                null,
                null,
                null,
                null, null);

        boolean isSuccess = this.service.editProduct(product);
        log.info("product edited successfully: {}", isSuccess);

        CategoryVO category = new CategoryVO(
                null,
                null,
            product_no,
            "지현update",
            "지현update",
            "지현update",
            "지현update",
            null
        );

        boolean isSuccess2 = this.service.editCategory(category);
        log.info("Category edited successfully : {}", isSuccess2);
    } // testProductEdit
    
    

    @Test(timeout=1000)	// 해당 물품번호의 물품 삭제
    public void testProductDelete() {
        log.debug("testProductDelete() invoked.");

        Integer product_no = 365;

        // category 삭제
        boolean isSuccess = this.service.deleteCategory(product_no);
        log.info("Category deleted successfully: {}",isSuccess);

        // product 삭제
        boolean isSuccess2 = this.service.deleteProduct(product_no);

        log.info("Product deleted successfully: {}",isSuccess2);
    } // testProductDelete
    
    
    
    @Test(timeout=1000)
	public void testGetListPerPage() {
		log.debug("testGetListPerPage() invoked.");

        int box_no = 1330;
		Criteria cri = new Criteria();
		cri.setCurrPage(1);
		cri.setAmount(6);
        cri.setBox_no(box_no);
		
		List<ProductCategoryVO> product = this.service.getListPerPage(cri);
		
		assert product != null;
		
		product.forEach(log::info);
	}//testGetListPerPage
    
    @Test(timeout=1000)
	public void testGetTotal() {
		log.debug("testGetTotal() invoked.");

        int box_no = 1330;

		int totalCount = this.service.getTotalCount(box_no);		
		log.info("\t+ totalCount: {}",totalCount);
	}//testGetTotal
    

} // end class
