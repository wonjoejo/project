package com.wonjoejo.myapp.controller;

import java.util.Map;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

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
public class BoardControllerTests {
	
	@Setter(onMethod_= {@Autowired})
	private WebApplicationContext ctx; 		//Spring Beans Container (DI핵심)
	
	private MockMvc mockMvc; 				//바로 브라우저를 emulation해주는 객체.
	private MockMvcBuilder mockMvcBuilder;  //MockMvc 객체를 생성해주는 builder 객체.
	
	@Before
	public void setup() {
		log.debug("setup() invoked.");
		
		assert this.ctx != null;
		log.info("\t+ ctx: {} ", this.ctx);
	}//setup
	
	@Test 
	public void testList() throws Exception {
		log.debug("testList() invoked.");
		
		//Step.1 : MockMvcBuilder 객체를 생성.
		MockMvcBuilder builder = MockMvcBuilders.webAppContextSetup(ctx);
		log.info("\t+ builder: {}" , builder);

		//Step.2 : MockMvcBuilder 객체를 이용해서, MockMvc (like web browser) 객체를 얻어냄
		MockMvc mockMvc = builder.build();
		log.info("\t+ mockMvc: {}" , mockMvc);

		//Step.3 : RequestBuiler 객체를 얻어내야 함 .
		//MockMvcRequestBuilders.전송방식메소드(우리가 요청할 requestURI지정)
		RequestBuilder reqBuilder = MockMvcRequestBuilders.get("/board/list");
		log.info("\t+ reqBuilder: {}" , reqBuilder);

		//Step.4 : MockMvc 객체를 통해서 , RequestBuilder 를 이용해서 , 실제 요청을 보냄
		ResultActions resultActions= mockMvc.perform(reqBuilder);
		log.info("\t+ resultActions: {}" , resultActions);

		//Step.5 : resultActions 으로부터, 테스트 대상이 되는 Controller(개발자가 만든)로부터
		//         2가지를 얻어낼수 있다 - Model and ViewName.
		MvcResult mvcResult = resultActions.andReturn();
		log.info("\t+ mvcResult: {}" , mvcResult);

		//Step.6 : Step.5에서 얻어낸 MvcResult로 부터, Model and View 를 얻기.
		ModelAndView modelAndView = mvcResult.getModelAndView();
		log.info("\t+ modelAndView: {}" , modelAndView);

		//Step.7 : ModelAndView 객체로부터, 우리가 알고자 하는 Model 이나 View이름을
		//			끄집어 낼 수 있다.
		Map<String, Object> model = modelAndView.getModel();
		log.info("\t+ model: {}",model);

		//Step.8 : ModelAndView 객체로부터, 우리가 알고자 하는 View 이름을 얻어내어 출력
		String viewName = modelAndView.getViewName();
		log.info("\t+  viewName: {}", viewName);
	}//textList	
	
	@Test
    public void testDetail() throws Exception {
        log.debug("testDetail() invoked.");

        MockMvcBuilder builder = MockMvcBuilders.webAppContextSetup(ctx);
        MockMvc mockMvc = builder.build();
        MockHttpServletRequestBuilder reqBuilder = MockMvcRequestBuilders.get("/board/detail");

        reqBuilder.param("board_idx","90");

        String viewName = mockMvc.perform(reqBuilder).andReturn().getModelAndView().getViewName();

        log.info("\t+ viewName: {}", viewName);

    } // testDetail
	
	@Test
	public void testWrite() throws Exception {
		log.debug("testWrite() invoked.");
		
		MockMvcBuilder mockMvcBuilder = MockMvcBuilders.webAppContextSetup(ctx);	
		MockMvc mockMvc = mockMvcBuilder.build();	
		MockHttpServletRequestBuilder reqBuilder = MockMvcRequestBuilders.post("/board/write");
		
		//3개의 전송파라미터를 요청문서에 전달 
		reqBuilder.param("member_id","MEMBERid99");
		reqBuilder.param("title","NEW TITLE");
		reqBuilder.param("content","NEW CONTENT");
		
		String viewName =   mockMvc.
							perform(reqBuilder).
							andReturn().
							getModelAndView(). 
							getViewName();
	
		log.info("\t+ viewName : {}",viewName);				
	}//testWrite
	
	@Test
	public void testEdit() throws Exception {
		log.debug("testEdit() invoked.");
		
		MockMvcBuilder mockMvcBuilder = MockMvcBuilders.webAppContextSetup(ctx);	
		MockMvc mockMvc = mockMvcBuilder.build();	
		MockHttpServletRequestBuilder reqBuilder = MockMvcRequestBuilders.post("/board/edit");
		
		//3개의 전송파라미터를 요청문서에 전달
		reqBuilder.param("board_idx","99");
		reqBuilder.param("member_id","MEMBERid99");
		reqBuilder.param("title","NEW TITLE");
		reqBuilder.param("content","NEW CONTENT");
		
		String viewName =   mockMvc.
							perform(reqBuilder).
							andReturn().
							getModelAndView(). 
							getViewName();
	
		log.info("\t+ viewName : {}",viewName);				
	}//testEdit
	
	@Test
    public void testDelete() throws Exception {
        log.debug("testDelete() invoked.");

        MockMvcBuilder builder = MockMvcBuilders.webAppContextSetup(ctx);
        MockMvc mockMvc = builder.build();
        MockHttpServletRequestBuilder reqBuilder = MockMvcRequestBuilders.post("/board/delete");

        reqBuilder.param("board_idx","174");

        String viewName = mockMvc.perform(reqBuilder).andReturn().getModelAndView().getViewName();

        log.info("\t+ viewName: {}", viewName);

    } // testDelete
	
	
	@After
	public void tearDown() {
		log.debug("tearDown() invoked.");
	}//tearDown
	
}
