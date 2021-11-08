package com.wonjoejo.myapp.service;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.wonjoejo.myapp.domain.BoxVO;
import com.wonjoejo.myapp.domain.ProductVO;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

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
    public void testGetList() {

        log.debug("getBoxList() invoked.");

        Integer box_no = 1005;
        List<ProductVO> list = this.service.getProductList(box_no);

        assert list != null;
        list.forEach(log::info);

    } // testGetList

    
    
    @Test(timeout=1000)
    public void testGetProduct() {

        log.debug("testGetProduct() invoked.");

        Integer product_no = 6;
        ProductVO product = this.service.getProductDetail(product_no);

        assert product != null;
        log.info("\t+ product: {}",product);

    } // testGetProduct

    
    
    @Test(timeout=1000)
    public void testCreateBox() {
        log.debug("createBox() invoked.");

        BoxVO box = new BoxVO(
                null,
                "userid3",
                2,
                "box_name_new",
                "box_memo_new",
                "photo_name",
                "photo_path",
                null
        );

        boolean isSuccess = this.service.createBox(box);

        log.info("Box created successfully: {}",isSuccess);

    } // testCreateBox

    @Test(timeout=1000)
    public void testEditBox() {

        log.debug("testEditBox() invoked");

        BoxVO box = new BoxVO(
                1098,
                null,
                null,
                "boxname",
                "boxmemo",
                "photoname",
                "photopath",
                null
                );

        boolean isSuccess = this.service.editBox(box);

        log.info("Box edited successfully: {}",isSuccess);
    } // testEditBox

    @Test(timeout=1000)
    public void testDeleteBox() {

        log.debug("testDeleteBox() invoked.");

        int box_no = 1099;
        boolean isSuccess = this.service.deleteBox(box_no);

        log.info("Box deleted successfully: {}",isSuccess);
    }

} // end class
