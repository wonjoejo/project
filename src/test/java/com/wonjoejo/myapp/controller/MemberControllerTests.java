package com.wonjoejo.myapp.controller;

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

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@WebAppConfiguration

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
        "file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
public class MemberControllerTests {

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
    
    
    // 회원가입
    @Test
    public void testRegister() throws Exception {
        log.debug("testRegister() invoked.");

        MockMvcBuilder builder = MockMvcBuilders.webAppContextSetup(ctx);
        MockMvc mockMvc = builder.build();
        MockHttpServletRequestBuilder reqBuilder = MockMvcRequestBuilders.post("/member/register");

        reqBuilder.param("member_id","contest3");
        reqBuilder.param("member_type","0");
        reqBuilder.param("member_status","0");
        reqBuilder.param("name","등록");
        reqBuilder.param("password","10041004");
        reqBuilder.param("email","1004@gmail.com");
        reqBuilder.param("phone_number","01010041004");
        reqBuilder.param("photo_name","photo_name");
        reqBuilder.param("photo_path","photo_path");
        reqBuilder.param("company_name","null");

        String viewName = mockMvc.perform(reqBuilder).andReturn().getModelAndView().getViewName();

        log.info("\t+ viewName: {}",viewName);

    } // testRegister

    @Test
    public void testEdit() throws Exception {
        log.debug("testEdit() invoked.");

        MockMvcBuilder builder = MockMvcBuilders.webAppContextSetup(ctx);
        MockMvc mockMvc = builder.build();
        MockHttpServletRequestBuilder reqBuilder = MockMvcRequestBuilders.post("/member/edit");
        
        reqBuilder.param("member_id","contest");
        reqBuilder.param("name","수정");
        reqBuilder.param("password","edit");
        reqBuilder.param("email","edit2@gmail.com");
        reqBuilder.param("phone_number","01022222222");
        reqBuilder.param("photo_name","modify_photo_name");
        reqBuilder.param("photo_path","modify_photo_path");

        String viewName = mockMvc.perform(reqBuilder).andReturn().getModelAndView().getViewName();

        log.info("\t+ viewName: {}", viewName);

    } // testEdit

    @Test
    public void testDelete() throws Exception {
        log.debug("testDelete() invoked.");

        MockMvcBuilder builder = MockMvcBuilders.webAppContextSetup(ctx);
        MockMvc mockMvc = builder.build();
        MockHttpServletRequestBuilder reqBuilder = MockMvcRequestBuilders.post("/member/delete");

        reqBuilder.param("member_id","contest");

        String viewName = mockMvc.perform(reqBuilder).andReturn().getModelAndView().getViewName();

        log.info("\t+ viewName: {}", viewName);

    } // testDelete


} // end class
