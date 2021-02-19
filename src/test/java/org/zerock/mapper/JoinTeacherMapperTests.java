package org.zerock.mapper;

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
public class JoinTeacherMapperTests {

	@Setter(onMethod_ = @Autowired)
	private JoinTeacherMapper mapper;
	
	// 전체 선생님 리스트  조회
//	@Test
//	public void testGetList() {
//		mapper.getList().forEach(list -> log.info(list));
//	}
	
	// insert
//	@Test
//	public void testInsert() {
//		JoinTeacherVO board = new JoinTeacherVO();
//		board.setUserId("test01");
//		board.setAtGrade("C");
//		board.setClassname("우주반");
//		board.setUserName("박선생");
//		board.setUserPw("1234");
//		board.setUserBirth("2121");
//		board.setUserPhone("011");
//		board.setUserAddr("우리집");
//		board.setUserEmail("email@");
//		board.setUserType("T");
//		
//		mapper.insert(board);
//		log.info(board);
//	}
	
	// read
//	@Test
//	public void testRead() {
//		JoinTeacherVO read = mapper.read("test01");
//		log.info(read);
//	}
	
	// update
//	@Test
//	public void testUpdate() {
//		JoinTeacherVO board = new JoinTeacherVO();
//		board.setUserId("test01");
//		board.setAtGrade("B");
//		board.setClassname("하늘반");
//		board.setUserName("박선생");
//		board.setUserPw("1234");
//		board.setUserBirth("1234");
//		board.setUserPhone("011");
//		board.setUserAddr("청주시 흥덕구");
//		board.setUserEmail("email@");
//		
//		int count = mapper.update(board);
//		log.info("UPDATE COUNT: " + count);
//	}
	
	// delete
//	@Test
//	public void testDelete() {
//		log.info("DELETE COUNT: " + mapper.delete("test01"));
//	}
	
}
