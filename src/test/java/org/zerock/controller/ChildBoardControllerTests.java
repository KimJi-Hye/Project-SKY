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
public class ChildBoardControllerTests {
	
	@Setter(onMethod_ = {@Autowired} )
	private WebApplicationContext ctx;

	private MockMvc mockMvc;

	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

	@Test
	public void testListPaging() throws Exception {
		
		log.info(mockMvc.perform(
				MockMvcRequestBuilders.get("/board/childList")
				.param("pageNum", "2")
				.param("amount", "50"))
				.andReturn().getModelAndView().getModelMap());
	}	
	
//	@Test
//	public void testList() throws Exception {
//
//		log.info(
//				mockMvc.perform(MockMvcRequestBuilders.get("/board/childList"))
//				.andReturn()
//				.getModelAndView()
//				.getModel());
//	}
	
//	@Test
//	public void testList() throws Exception {
//
//		log.info(
//				mockMvc.perform(MockMvcRequestBuilders.get("/board/childList"))
//				.andReturn()
//				.getModelAndView()
//				.getModel());
//	}
	
//	@Test
//	public void testRegister() throws Exception {
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/childRegister")
//				.param("cunicode", "C210210005")
//				.param("classname", "하늘반")
//				.param("cgender", "남자")
//				.param("cname", "최하늘")
//				.param("cbirth", "2020/8/12")
//				.param("enter", "2021/7/13")
//				.param("graduation", "2020/08/15")
//				).andReturn().getModelAndView().getViewName();
//		log.info(resultPage);
//	}
	
//	@Test
//	public void testGet() throws Exception {
//		log.info(mockMvc.perform(MockMvcRequestBuilders
//				.get("/board/childGet")
//				.param("cunicode", "C210210005"))
//				.andReturn()
//				.getModelAndView().getModelMap());
//	}
	
//	@Test
//	public void testModify() throws Exception {
//		String resultPage = mockMvc
//				.perform(MockMvcRequestBuilders.post("/board/childModify")
//				.param("cunicode", "C210210005")
//				.param("classname", "하늘반")
//				.param("cname", "최최최")
//				.param("cbirth", "2020/8/12")
//				).andReturn().getModelAndView().getViewName();
//		log.info(resultPage);
//						
//	}
	
//	@Test
//	public void testRemove()throws Exception {
//		// 삭제전 데이터베이스에 게시물 번호 확인할 것
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/childRemove")
//				.param("cunicode", "C210210005")
//				).andReturn().getModelAndView().getViewName();
//		log.info(resultPage);
//	}
	
}
