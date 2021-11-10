package com.wonjoejo.myapp.controller;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.*;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.ui.ModelMap;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import java.util.Locale;
import java.util.Objects;

@Log4j2
@NoArgsConstructor

@WebAppConfiguration

@RunWith(SpringRunner.class)
@ContextConfiguration({
        "file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
public class ProductControllerTests {

    @Setter(onMethod_= { @Autowired})
    private WebApplicationContext ctx;

    private MockMvc mockMvc;
    private MockMvcBuilder mockMvcBuilder;

    @Before
    public void setup() {
        log.debug("setup() invoked.");

        assert this.ctx != null;
        log.info("\t+ ctx:{}",this.ctx);
    } // setup

    
    @Test
    public void testProductList() throws Exception {
        log.debug("testProductList() invoked.");

        MockMvcBuilder builder = MockMvcBuilders.webAppContextSetup(ctx);
        MockMvc mockMvc = builder.build();
        MockHttpServletRequestBuilder reqBuilder = MockMvcRequestBuilders.get("/product/list");

        reqBuilder.param("box_no", "1005");

        ModelMap modelMap = Objects.requireNonNull(mockMvc.
                        perform(reqBuilder).
                        andReturn().
                        getModelAndView()).
                getModelMap();

        modelMap.forEach(log::info);

    } // testProductList
    
    
    
    @Test
    public void testProductDetail() throws Exception {
        log.debug("testProductDetail() invoked.");

        MockMvcBuilder builder = MockMvcBuilders.webAppContextSetup(ctx);
        MockMvc mockMvc = builder.build();
        MockHttpServletRequestBuilder reqBuilder = MockMvcRequestBuilders.get("/product/detail");

        reqBuilder.param("product_no", "6");

        ModelMap modelMap = Objects.requireNonNull(mockMvc.
                        perform(reqBuilder).
                        andReturn().
                        getModelAndView()).
                getModelMap();

        modelMap.forEach(log::info);

    } // testProductDetail
    
    
    

    @Test
    public void testProductInsert() throws Exception {
        log.debug("testProductInsert() invoked.");

        MockMvcBuilder builder = MockMvcBuilders.webAppContextSetup(ctx);
        MockMvc mockMvc = builder.build();
        MockHttpServletRequestBuilder reqBuilder = MockMvcRequestBuilders.get("/product/insert");

        reqBuilder.param("product_no", "");
        reqBuilder.param("box_no", "1339");
        reqBuilder.param("product_name","product_name");
        reqBuilder.param("product_memo","memomemo123");
        reqBuilder.param("product_qtn","20");
        reqBuilder.param("product_photo_name","");
        reqBuilder.param("product_photo_path","");
        reqBuilder.param("barcode","");

        // category insert
        reqBuilder.param("product_no", "");
        reqBuilder.param("cate_detail1", "주황색");
        reqBuilder.param("cate_detail2", "");
        reqBuilder.param("cate_detail3", "");
        reqBuilder.param("cate_detail4", "");
        reqBuilder.param("cate_detail5", "");

        String viewName = mockMvc.perform(reqBuilder).andReturn().getModelAndView().getViewName();

        log.info("\t+ viewName: {}",viewName);

    } // testProductInsert
    

    
//    @Test
//    public void testProductEdit() throws Exception {
//        log.debug("testProductEdit() invoked.");
//
//        MockMvcBuilder builder = MockMvcBuilders.webAppContextSetup(ctx);
//        MockMvc mockMvc = builder.build();
//        MockHttpServletRequestBuilder reqBuilder = MockMvcRequestBuilders.post("/product/edit");
//
//        reqBuilder.param("product_no", "");
//        reqBuilder.param("box_no", "");
//        reqBuilder.param("product_name","product_name");
//        reqBuilder.param("product_memo","memomemo");
//        reqBuilder.param("product_qtn","20");
//        reqBuilder.param("product_photo_name","");
//        reqBuilder.param("product_photo_path","");
//        reqBuilder.param("barcode","");
//
//        String viewName = mockMvc.perform(reqBuilder).andReturn().getModelAndView().getViewName();
//
//        log.info("\t+ viewName: {}", viewName);
//
//    } // testProductEdit
    
    
//
//    @Test
//    public void testDelete() throws Exception {
//        log.debug("testDelete() invoked.");
//
//        MockMvcBuilder builder = MockMvcBuilders.webAppContextSetup(ctx);
//        MockMvc mockMvc = builder.build();
//        MockHttpServletRequestBuilder reqBuilder = MockMvcRequestBuilders.post("/box/delete");
//
//        reqBuilder.param("box_no","1202");
//
//        String viewName = mockMvc.perform(reqBuilder).andReturn().getModelAndView().getViewName();
//
//        log.info("\t+ viewName: {}", viewName);
//
//    } // testDelete


} // end class
