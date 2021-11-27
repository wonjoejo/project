package com.wonjoejo.myapp.mapper;

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
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ProductMapperTests {

    @Setter(onMethod_ = {@Autowired})
    private ProductMapper mapper;


    @Before
    public void setup() {

        log.debug("setup() invoked.");

        assert this.mapper != null;
        log.info("\t+ mapper: {}", this.mapper);
        log.info("\t+ type: {}", this.mapper.getClass().getName());

    } // setup


    @Test    // box 번호를 기준으로 그 박스의 물품 리스트 조회
    public void testProductList() {
        log.debug("testProductList() invoked.");

        Integer box_no = 1349;
        Criteria cri = new Criteria();
        cri.setCurrPage(1);
        cri.setAmount(5);
        cri.setBox_no(box_no);

        List<ProductCategoryVO> list = this.mapper.getListPaging(cri);
        log.info("{} 박스 물품 리스트: ", box_no + list.get(0).getProduct_memo());
        list.forEach(log::info);

    } // testProductList


    @Test    // 물품 번호를 기준으로 물품 정보 조회
    public void testProductDetail() {
        log.debug("testProductxList() invoked.");

        Integer product_no = 352;

        ProductVO product = this.mapper.selectProduct(product_no);
        log.info("{}번 물품 조회: {}", product_no, product);

        // Category Detail
        CategoryVO category = this.mapper.selectCategory(product_no);
        log.info("\t+ Category: {}", category);

        // BaseCategory Detail
        Integer box_no = 1331;
        BaseCategoryVO baseCategory = this.mapper.selectBaseCategory(box_no);
        log.info("\t+ BaseCategory: {}", baseCategory);

    } // testProductDetail


    @Test    // INSERT
    public void testProductInsert() {
        log.debug("testProductInsert() invoked.");

        Integer box_no = 1331;
        String product_name = "productInsert";
        String product_memo = "productMemo";
        Integer product_qtn = 2;

        ProductVO product = new ProductVO(
                null,
                box_no,
                product_name,
                product_memo,
                product_qtn,
                null,
                null,
                null,
                null,
                null);

        this.mapper.insertProduct(product);
        log.info("\t+ product: {}", product);

        // Category insert
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

        this.mapper.insertCategory(category);
        log.info("\t+ category: {}", category);

    } // testProductInsert


    @Test    // UPDATE
    public void testProductEdit() {
        log.debug("testProductEdit() invoked.");

        Integer product_no = 358;
        Integer box_no = null;
        String product_name = "지현update";
        String product_memo = "지현update";
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
                null,
                null);

        this.mapper.updateProduct(product);
        log.info("\t+ product: {}", product);

        CategoryVO category = new CategoryVO(
                null,
                null,
                product_no,
                "지현edit",
                "지현edit",
                "지현edit",
                "지현edit",
                "지현edit"
        );

        this.mapper.updateCategory(category);
        log.info("\t+ category: {}", category);

    } // testProductEdit


    @Test    // DELETE
    public void testProductDelete() {
        log.debug("testProductDelete() invoked.");

        Integer product_no = 398;

        // Category 삭제
        // product 하위라 category 먼저 지워줘야함
        this.mapper.deleteCategory(product_no);

        // Product 삭제
        this.mapper.deleteProduct(product_no);

        log.info("\t+ product: {} ", product_no);


    } // testProductDelete

} // end class
