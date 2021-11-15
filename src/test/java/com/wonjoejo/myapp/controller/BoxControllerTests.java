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
public class BoxControllerTests {

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
    public void testList() throws Exception {
        log.debug("testList() invoked.");

        MockMvcBuilder builder = MockMvcBuilders.webAppContextSetup(ctx);
        MockMvc mockMvc = builder.build();
        MockHttpServletRequestBuilder reqBuilder = MockMvcRequestBuilders.get("/box/list");

        reqBuilder.param("member_id","MEMBERid32");

        ModelMap modelMap = Objects.requireNonNull(mockMvc.
                        perform(reqBuilder).
                        andReturn().
                        getModelAndView()).
                getModelMap();

        modelMap.forEach(log::info);

    } // testList

    @Test
    public void testCreate() throws Exception {
        log.debug("testCreate() invoked.");

        MockMvcBuilder builder = MockMvcBuilders.webAppContextSetup(ctx);
        MockMvc mockMvc = builder.build();
        MockHttpServletRequestBuilder reqBuilder = MockMvcRequestBuilders.post("/box/create");

        reqBuilder.param("member_id","MEMBERid32");
        reqBuilder.param("box_mode","1");
        reqBuilder.param("box_name","namename");
        reqBuilder.param("box_memo","memomemo");
        reqBuilder.param("box_photo_name","photo_name");
        reqBuilder.param("box_photo_path","photo_path");

        String viewName = Objects.requireNonNull(mockMvc.perform(reqBuilder).andReturn().getModelAndView()).getViewName();

        log.info("\t+ viewName: {}",viewName);

    } // testCreate

    @Test
    public void testEdit() throws Exception {
        log.debug("testEdit() invoked.");

        MockMvcBuilder builder = MockMvcBuilders.webAppContextSetup(ctx);
        MockMvc mockMvc = builder.build();
        MockHttpServletRequestBuilder reqBuilder = MockMvcRequestBuilders.post("/box/edit");

        reqBuilder.param("box_no","1131");
        reqBuilder.param("member_id","MEMBERid32");
        reqBuilder.param("box_name","namename12");
        reqBuilder.param("box_memo","memomemo12");
        reqBuilder.param("box_photo_name","photo_name12");
        reqBuilder.param("box_photo_path","photo_path12");

        String viewName = mockMvc.perform(reqBuilder).andReturn().getModelAndView().getViewName();

        log.info("\t+ viewName: {}", viewName);

    } // testEdit

    @Test
    public void testDelete() throws Exception {
        log.debug("testDelete() invoked.");

        MockMvcBuilder builder = MockMvcBuilders.webAppContextSetup(ctx);
        MockMvc mockMvc = builder.build();
        MockHttpServletRequestBuilder reqBuilder = MockMvcRequestBuilders.post("/box/delete");

        reqBuilder.param("box_no","1202");

        String viewName = mockMvc.perform(reqBuilder).andReturn().getModelAndView().getViewName();

        log.info("\t+ viewName: {}", viewName);

    } // testDelete


} // end class
