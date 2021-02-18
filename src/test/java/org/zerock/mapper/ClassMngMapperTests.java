package org.zerock.mapper;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.ClassMngVO;
import org.zerock.domain.ClassNoteVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
//Java Config
//@ContextConfiguration(classes = {org.zerock.config.RootConfig.class})
@Log4j
public class ClassMngMapperTests {

	@Setter(onMethod_ = @Autowired)
	private ClassMngMapper mapper;
	
	
	
//	@Test
//	public void testGetList() {
//		
//		mapper.getList().forEach(board -> log.info(board));
//	}
	
	
	
//	@Test
//	public void testInsert() {
//		
//		ClassBoardVO board = new ClassBoardVO();
//		board.setClassName("테스트반");
//		board.setClassAge(7L);
//		board.setClassTotal(20L);
//		
//		mapper.insert(board);
//		
//		log.info(board);
//	}
	
	
	
	
//	@Test
//	public void testInsertSelectKey() {
//		
//		ClassBoardVO board = new ClassBoardVO();
//		board.setClassName("테스트2반");
//		board.setClassAge(6L);
//		board.setClassTotal(10L);
//		
//		mapper.insertSelectKey(board);;
//		
//		log.info(board);
//	}
	
	
	
//	@Test
//	public void testRead() {
//		
//
//		// 존재하는 게시물 번호로 테스트
//		ClassMngVO board = mapper.read("하늘반");
//		
//		log.info(board);
//	}

	
	
//	@Test
//	public void testDelete() {
//		
//		log.info("DELETE COUNT: " + mapper.delete(29L));
//	}
	
	
//	@Test
//	public void testUpdate() {
//		
//		ClassMngVO board = new ClassMngVO();
//		// 실행 전 존재하는 번호인지 확인할 것
//		board.setBno(31L);
//		board.setClassName("테스트반");
//		board.setClassAge(6L);
//		board.setClassTotal(10L);
//
//		
//		int count = mapper.update(board);
//		log.info("UPDATE COUNT: " + count);
//	}
//	

}
