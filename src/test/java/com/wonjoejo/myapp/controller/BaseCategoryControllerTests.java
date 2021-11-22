package com.wonjoejo.myapp.controller;


import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;


@Log4j2
@NoArgsConstructor

@WebAppConfiguration

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
        "file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
public class BaseCategoryControllerTests {

    @Setter(onMethod_={@Autowired})
    private WebApplicationContext ctx;

    private MockMvc mockMvc;
    private MockMvcBuilder mockMvcBuilder;

    @Before
    public void setup(){
        log.debug("setup() invoked.");

        assert this.ctx != null;
        log.info("\t+ ctx : {} ", this.ctx);

    } // setup

    @Test
    public void testGetDetail() throws Exception {
        log.debug("testGetDetail() invoked.");

        MockMvcBuilder builder = MockMvcBuilders.webAppContextSetup(ctx);
        MockMvc mockMvc = builder.build();
        MockHttpServletRequestBuilder reqBuilder = MockMvcRequestBuilders.get("/category/detail");

        reqBuilder.param("box_no" , "1339");

        String viewName = mockMvc.perform(reqBuilder).andReturn().getModelAndView().getViewName();

        log.info("\t+ viewName: {}", viewName);

    } // testGetDetail

    @Test
    public void testEdit() throws Exception {
        log.debug("testEdit() invoked.");

        MockMvcBuilder builder = MockMvcBuilders.webAppContextSetup(ctx);
        MockMvc mockMvc = builder.build();
        MockHttpServletRequestBuilder reqBuilder = MockMvcRequestBuilders.post("/category/edit");

        reqBuilder.param("category_no", "95919");
        reqBuilder.param("cate_name1", "");
        reqBuilder.param("cate_name2", "색상");
        reqBuilder.param("cate_name3", "");
        reqBuilder.param("cate_name4", "");
        reqBuilder.param("cate_name5", "");
        reqBuilder.param("box_no", "1096");

        String viewName = mockMvc.perform(reqBuilder).andReturn().getModelAndView().getViewName();
        log.info("\t+ viewName: {} ", viewName);
    } // testEdit

    @Test
    public void testDelete() throws Exception {
        log.debug("testDelete() invoked.");

        MockMvcBuilder builder = MockMvcBuilders.webAppContextSetup(ctx);
        MockMvc mockMvc = builder.build();
        MockHttpServletRequestBuilder reqBuilder = MockMvcRequestBuilders.post("/category/delete");

        reqBuilder.param("category_no", "95924");
        reqBuilder.param("cate_name5", "");

        reqBuilder.param("box_no", "1339");

        reqBuilder.param("category_no","95924");
        reqBuilder.param("cate_detail5","");


        String viewName = mockMvc.perform(reqBuilder).andReturn().getModelAndView().getViewName();
        log.info("\t+ viewName: {} ", viewName);

    } // testDelete



} // BaseCategoryTests
