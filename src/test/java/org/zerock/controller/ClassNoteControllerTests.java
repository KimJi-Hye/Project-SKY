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
public class ClassNoteControllerTests {
	@Setter(onMethod_ = {@Autowired} )
	private WebApplicationContext ctx;

	private MockMvc mockMvc;

	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

//	@Test
//	public void testList() throws Exception {
//
//		log.info(
//				mockMvc.perform(MockMvcRequestBuilders.get("/board/noteList"))
//				.andReturn()
//				.getModelAndView()
//				.getModel());
//	}
	
//	@Test
//	public void testListPaging() throws Exception {
//
//		log.info(
//				mockMvc.perform(MockMvcRequestBuilders.get("/board/noteList")
//				.param("pageNum", "1")
//				.param("amount", "10"))
//				.andReturn().getModelAndView().getModelMap());
//	}
	
//	@Test
//	public void testRegister() throws Exception {
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/noteRegister")
//				.param("className", "하늘반")
//				.param("cUnicode", "C210210002")
//				.param("Title", "제목2")
//				.param("Content", "내용2")
//				.param("Writer", "작성자2"))
//				.andReturn().getModelAndView().getViewName();
//		log.info(resultPage);
//	}
	
//	@Test
//	public void testGet() throws Exception {
//		log.info(mockMvc.perform(MockMvcRequestBuilders
//				.get("/board/noteGet")
//				.param("bno", "8"))
//				.andReturn()
//				.getModelAndView().getModelMap());
//	}
	
//	@Test
//	public void testModify() throws Exception {
//		String resultPage = mockMvc
//				.perform(MockMvcRequestBuilders.post("/board/noteModify")
//				.param("bno", "4150")
//				.param("Title", "제목1000")
//				.param("Content", "내용10")
//				.param("Writer", "작성자10"))
//				.andReturn().getModelAndView().getViewName();
//		log.info(resultPage);
//						
//	}
	
//	@Test
//	public void testRemove()throws Exception {
//		// 삭제전 데이터베이스에 게시물 번호 확인할 것
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/noteRemove")
//				.param("bno", "2")
//				).andReturn().getModelAndView().getViewName();
//		log.info(resultPage);
//	}





}
