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
public class JoinTeacherControllerTests {

	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	// 리스트
//	@Test
//	public void testList() throws Exception {
//		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/member/list")
//				.param("userType", "P"))
//				.andReturn()
//				.getModelAndView()
//				.getModelMap());
//	}
	
	// 회원가입
//	@Test
//	public void testJoin() throws Exception {
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/member/join")
//				.param("userId", "teacher2")
//				.param("atGrade", "b")
//				.param("className", "")
//				.param("userName", "홍선생")
//				.param("userPw", "1234")
//				.param("userPhone", "tel")
//				.param("userAddr", "home")
//				.param("userEmail", "email")
//				.param("userType", "T")
//				).andReturn().getModelAndView().getViewName();
//		log.info(resultPage);
//	}
	
	// 조회
//	@Test
//	public void testGet() throws Exception {
//		log.info(mockMvc.perform(MockMvcRequestBuilders
//				.get("/member/get")
//				.param("userId", "teacher2"))
//				.andReturn().getModelAndView().getModelMap());
//	}
	
	// 수정
//	@Test
//	public void testModify() throws Exception {
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/member/modify")
//				.param("userId", "teacher2")
//				.param("atGrade", "b")
//				.param("className", "하늘반")
//				.param("userName", "홍선생")
//				.param("userPw", "1234")
//				.param("userPhone", "tel수정")
//				.param("userAddr", "home수정")
//				.param("userEmail", "email수정")
//				.param("userType", "T")
//				).andReturn().getModelAndView().getViewName();
//		log.info(resultPage);
//	}
	
	// 삭제
//	@Test
//	public void testRemove() throws Exception {
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/member/remove")
//				.param("userId", "teacher2"))
//				.andReturn().getModelAndView().getViewName();
//		log.info(resultPage);
//	}
	
}
