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
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Log4j
public class AuthorControllerTests {

	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	// 리스트
//	@Test
//	public void testLiat() throws Exception {
//		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/author/list"))
//				.andReturn()
//				.getModelAndView()
//				.getModel());
//	}
	
	// 등록
//	@Test
//	public void testRegister() throws Exception{
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/author/register")
//				.param("atgrade", "S")
//				.param("atname", "테스트 이름")
//				.param("classname", "반이름"))
//				.andReturn().getModelAndView().getViewName();
//		log.info(resultPage);
//	}
	
	// 조회
//	@Test
//	public void testGet() throws Exception{
//		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/author/get")
//				.param("atgrade", "S"))
//				.andReturn().getModelAndView().getModelMap());
//	}
	
	// 수정
//	@Test
//	public void testModify() throws Exception{
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/author/modify")
//				.param("atgrade", "S")
//				.param("atname", "테스트 수정")
//				.param("classname", "반이름 수정"))
//				.andReturn().getModelAndView().getViewName();
//		log.info(resultPage);
//	}
	
	// 삭제
//	@Test
//	public void testRemove() throws Exception {
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/author/remove")
//				.param("atgrade", "S"))
//				.andReturn().getModelAndView().getViewName();
//		log.info(resultPage);
//	}
	
}
