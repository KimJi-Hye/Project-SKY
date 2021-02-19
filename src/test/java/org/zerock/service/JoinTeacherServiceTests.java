package org.zerock.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.JoinTeacherVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class JoinTeacherServiceTests {

	@Setter(onMethod_ = {@Autowired})
	private JoinTeacherService service;
	
	// 객체 생성 테스트
//	@Test
//	public void testExist() {
//		log.info(service);
//		assertNotNull(service);
//	}
	
	// 회원가입
//	@Test
//	public void testJoin() {
//		JoinTeacherVO join = new JoinTeacherVO();
//		join.setUserId("teacher1");
//		join.setAtGrade("B");
//		join.setClassname("하늘반");
//		join.setUserName("최선생");
//		join.setUserPw("4321");
//		join.setUserBirth("1234");
//		join.setUserPhone("010");
//		join.setUserAddr("청주시 가경동");
//		join.setUserEmail("email@email");
//		join.setUserType("T");
//		
//		service.join(join);
//		log.info(">> 회원가입 된 회원 아이디 : " + join.getUserId());
//	}
	
	// 회원리스트
//	@Test
//	public void testGetList() {
//		service.getList().forEach(list -> log.info(list));
//	}
	
	// 회원 아이디 조회
//	@Test 
//	public void testget() {
//		log.info(service.get("teacher1"));
//	}
	
	// 회원 수정
//	@Test
//	public void testUpdate() {
//		JoinTeacherVO join = service.get("teacher1");
//		
//		if(join == null) {
//			return;
//		}
//		join.setUserEmail("이메일수정@");
//		log.info("MODIFY RESULT: " + service.modify(join));
//	}
	
	// 회원 탈퇴
	@Test
	public void testDelete() {
		log.info("REMOVE RESULT : " + service.remove("teacher1"));
	}
	
}
