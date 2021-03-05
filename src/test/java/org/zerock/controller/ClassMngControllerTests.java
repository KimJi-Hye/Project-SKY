package org.zerock.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
// Test for Controller
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})

@Log4j
public class ClassMngControllerTests {
	@Setter(onMethod_ = {@Autowired} )
	private WebApplicationContext ctx;

	private MockMvc mockMvc;

	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

	@Test
	public void testList() throws Exception {

		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/admin/classList"))
				.andReturn()
				.getModelAndView()
				.getModel());
	}
	
//	@Test
//	public void testRegister() throws Exception {
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/admin/classRegister")
//				.param("className", "테스트")
//				.param("classAge", "7")
//				.param("classTotal", "20")
//				).andReturn().getModelAndView().getViewName();
//		log.info(resultPage);
//	}
	
//	@Test
//	public void testGet() throws Exception {
//		log.info(mockMvc.perform(MockMvcRequestBuilders
//				.get("/board/classGet")
//				.param("className", "하늘반"))
//				.andReturn()
//				.getModelAndView().getModelMap());
//	}
	
//	@Test
//	public void testModify() throws Exception {
//		String resultPage = mockMvc
//				.perform(MockMvcRequestBuilders.post("/board/classModify")
//				.param("bno", "33")
//				.param("className", "test")
//				.param("classAge", "6")
//				.param("classTotal", "10"))
//				.andReturn().getModelAndView().getViewName();
//		log.info(resultPage);
//						
//	}
	
//	@Test
//	public void testRemove()throws Exception {
//		// 삭제전 데이터베이스에 게시물 번호 확인할 것
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/classRemove")
//				.param("bno", "33")
//				).andReturn().getModelAndView().getViewName();
//		log.info(resultPage);
//	}





}
