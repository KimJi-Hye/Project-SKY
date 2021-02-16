package org.zerock.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.JoinParentsVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class JoinParentsServiceTests {

	@Setter(onMethod_ = {@Autowired})
	private JoinParentsService service;
	
//	@Test
//	public void testExist() {
//		log.info(service);
//		assertNotNull(service);
//	}
	
	// 회원가입
//	@Test
//	public void testJoin() {
//		JoinParentsVO join = new JoinParentsVO();
//		join.setUserId("parents1");
//		join.setCUnicode("C210210002");
//		join.setAtGrade('b');
//		join.setUserName("김부모");
//		join.setUserPw("1234");
//		join.setUserPhone("010");
//		join.setUserAddr("청주시 가경동");
//		join.setUserEmail("email@");
//		join.setUserType('P');
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
//		log.info(service.get("parents1"));
//	}
	
	// 회원 수정
//	@Test
//	public void testUpdate() {
//		JoinParentsVO join = service.get("parents1");
//		
//		if(join == null) {
//			return;
//		}
//		join.setUserEmail("이메일수정@");
//		log.info("MODIFY RESULT: " + service.modify(join));
//	}
	
	// 회원 탈퇴
//	@Test
//	public void testDelete() {
//		log.info("REMOVE RESULT : " + service.remove("parents1"));
//	}

}
