package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.ApplyBoardVO;
import org.zerock.domain.JoinParentsVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class JoinParentsMapperTests {

	@Setter(onMethod_ = @Autowired)
	private JoinParentsMapper mapper;
	
	// 부모 리스트
//	@Test
//	public void testGetList() {
//		mapper.getList().forEach(list -> log.info(list));
//	}
	
	// idCheck
	@Test
	public void testIdCheck() {
		mapper.idCheck("pp");
	}
	
	// insert
//	@Test
//	public void testInsert() {
//		JoinParentsVO board = new JoinParentsVO();
//		board.setUserId("pid4");
//		board.setAuth("c");
//		board.setCunicode("C210210003");
//		board.setUserName("나부모");
//		board.setUserPw("1234");
//		board.setUserBirth("20210219");
//		board.setUserPhone("010");
//		board.setUserAddr("우리집");
//		board.setUserEmail("email@");
//		board.setUserType("P");
//		board.setRelation("부");
//		board.setApptype("헤헷");
//		mapper.insert(board);
//		log.info(board);
//	}
	
	// read
//	@Test
//	public void testRead() {
//		JoinParentsVO read = mapper.read("pid4");
//		log.info(read);
//	}
	
	// read applyParents
//	@Test
//	public void testReadParents() {
//		ApplyBoardVO read = mapper.readParents("C210210003");
//		log.info(read);
//	}
	
	// read Apply List
//	@Test
//	public void testApplyList() {
//		mapper.applyList().forEach(list -> log.info(list));
//	}
	
	// update
//	@Test
//	public void testUpdate() {
//		JoinParentsVO board = new JoinParentsVO();
//		board.setUserId("pid4");
//		board.setAtGrade("c");
//		board.setCunicode("C210210003");
//		board.setUserName("나부모");
//		board.setUserPw("1234");
//		board.setUserBirth("20210219");
//		board.setUserPhone("010");
//		board.setUserAddr("우리집");
//		board.setUserEmail("email@수정");
//		board.setRelation("부");
//		board.setApptype("헤헷");
//		
//		int count = mapper.update(board);
//		log.info("UPDATE COUNT: " + count);
//	}
	
	// delete
//	@Test
//	public void testDelete() {
//		log.info("DELETE COUNT: " + mapper.delete("pid4"));
//	}
	
}
