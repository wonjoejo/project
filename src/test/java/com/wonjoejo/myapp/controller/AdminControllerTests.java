package com.wonjoejo.myapp.controller;

import java.util.Map;
import java.util.Objects;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.ui.ModelMap;
import org.springframework.web.context.WebApplicationContext;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@WebAppConfiguration

@RunWith(SpringRunner.class)
@ContextConfiguration({
        "file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
public class AdminControllerTests {

    @Setter(onMethod_= {@Autowired})
    private WebApplicationContext ctx;

    private MockMvc mockMvc;
    private MockMvcBuilder mockMvcBuilder;

    @Before
    public void setup() {
        log.debug("setup() invoked.");

        assert this.ctx != null;
        log.info("\t+ ctx:{}",this.ctx);
    } // setup
    
    // 전체 회원 목록 조회
    @Test
    public void testList() throws Exception {
        log.debug("testList() invoked.");

        MockMvcBuilder builder = MockMvcBuilders.webAppContextSetup(ctx);
        MockMvc mockMvc = builder.build();
        
        RequestBuilder reqBuilder = MockMvcRequestBuilders.get("/admin/list");
        
        Map<String,Object> model=
				mockMvc.
					perform(reqBuilder).
					andReturn().
					getModelAndView().
					getModel(); // 호출하고 싶은게 model이면 Map 객체

        model.forEach(log::info);
       
    } // testList
    
    // 특정 회원 상세조회
    @Test
    public void testDetail() throws Exception {
        log.debug("testDetail() invoked.");

        MockMvcBuilder builder = MockMvcBuilders.webAppContextSetup(ctx);
        MockMvc mockMvc = builder.build();
        
        MockHttpServletRequestBuilder reqBuilder = MockMvcRequestBuilders.get("/admin/detail");
        
        reqBuilder.param("member_id","MEMBERid16");
        
        String viewName = mockMvc.perform(reqBuilder).andReturn().getModelAndView().getViewName();

        log.info("\t+ viewName: {}", viewName);

    } // testDetail
    
    // 회원 검색
    @Test
    public void testSearch() throws Exception {
        log.debug("testSearch() invoked.");

        MockMvcBuilder builder = MockMvcBuilders.webAppContextSetup(ctx);
        MockMvc mockMvc = builder.build();
        
        MockHttpServletRequestBuilder reqBuilder = MockMvcRequestBuilders.get("/admin/search");
        
        reqBuilder.param("member_id","MEMBERid32");
        reqBuilder.param("name","이름7");

        ModelMap modelMap = Objects.requireNonNull(mockMvc.
                        perform(reqBuilder).
                        andReturn().
                        getModelAndView()).
                getModelMap();
        
        modelMap.forEach(log::info);

    } // testSearch


} // end class
