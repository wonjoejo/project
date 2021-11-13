package com.wonjoejo.myapp.controller;

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
public class GroupControllerTests {

    @Setter(onMethod_= { @Autowired})
    private WebApplicationContext ctx;

    private MockMvc mockMvc;
    private MockMvcBuilder mockMvcBuilder;
	
	@Before
	public void setup() {
		log.debug("setup() invoked.");
		
		assert this.ctx !=null;
		log.info("\t+ ctx : {}", this.ctx);
	}//set up
	
	//그룹원 리스트
	@Test
	public void testGropList() throws Exception {
		log.debug("testGropList() invoked.");
		
		MockMvcBuilder builder = MockMvcBuilders.webAppContextSetup(ctx);
        MockMvc mockMvc = builder.build();
        MockHttpServletRequestBuilder reqBuilder = MockMvcRequestBuilders.get("/group/grouplist");

        reqBuilder.param("box_no","1097");

        ModelMap modelMap = Objects.requireNonNull(mockMvc.
                        perform(reqBuilder).
                        andReturn().
                        getModelAndView()).
                getModelMap();

        modelMap.forEach(log::info);
		
	}//testGropList
	
	
	//그룹 권한 리스트
	@Test
	public void testPermissionlist() throws Exception {
		log.debug("testPermissionlist() invoked.");
		
		MockMvcBuilder builder = MockMvcBuilders.webAppContextSetup(ctx);
        MockMvc mockMvc = builder.build();
        MockHttpServletRequestBuilder reqBuilder = MockMvcRequestBuilders.get("/group/permissionlist");

        reqBuilder.param("box_no","1097");

        ModelMap modelMap = Objects.requireNonNull(mockMvc.
                        perform(reqBuilder).
                        andReturn().
                        getModelAndView()).
                getModelMap();

        modelMap.forEach(log::info);
		
	}//testPermissionlist
	
	//그룹 가입
	@Test
	public void testJoin() throws Exception {
		log.debug("testJoin() invoked.");
		
		MockMvcBuilder builder = MockMvcBuilders.webAppContextSetup(ctx);
        MockMvc mockMvc = builder.build();
        MockHttpServletRequestBuilder reqBuilder = MockMvcRequestBuilders.get("/group/join");

        reqBuilder.param("member_id","자영");
        reqBuilder.param("Box_no","1097");
        reqBuilder.param("master_per","1");
        reqBuilder.param("write_per","1");
        reqBuilder.param("read_per","1");
        reqBuilder.param("edit_per","1");
        reqBuilder.param("delete_per","1");
        reqBuilder.param("member_stat","0");

        String viewName = Objects.requireNonNull(mockMvc.perform(reqBuilder).andReturn().getModelAndView()).getViewName();

        log.info("\t+ viewName: {}",viewName);

	}//testJoin
	
	
	//그룹 권한 변경
	
	//그룹 탈퇴 
	
}//end class
