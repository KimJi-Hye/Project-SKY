package org.zerock.mapper;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.EventBoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
//Java Config
//@ContextConfiguration(classes = {org.zerock.config.RootConfig.class})
@Log4j
public class EventBoardMapperTests {

	@Setter(onMethod_ = @Autowired)
	private EventBoardMapper mapper;
	
//	@Test
//	public void testGetList() {
//		
//		mapper.getList().forEach(board -> log.info(board));
//	}
	
//	@Test
//	public void testInsert() {
//		
//		EventBoardVO board = new EventBoardVO();
//		
//		board.setTitle("제목");
//		board.setContent("내용");
//		board.setColor("초록색");
//		
//		mapper.insert(board);
//		
//		log.info(board);
//	}
//	
//	
//	
//	
//	
//	
//	
//	@Test
//	public void testRead() {
//		
//		// 존재하는 게시물 번호로 테스트
//		EventBoardVO board = mapper.read(1L);
//		
//		log.info(board);
//	}
//
//	
//	
//	@Test
//	public void testDelete() {
//		
//		EventBoardVO board = new EventBoardVO();
//		
//		board.setBno(4L);
//		
//		mapper.delete(board);
//		log.info("DELETE COUNT: " + board);
//	}
//	
//	@Test
//	public void testUpdate() {
//		
//		EventBoardVO board = new EventBoardVO();
//
//		board.setBno(2L);
//		board.setTitle("수정테스트");
//		board.setContent("제목수정테스트");
//		board.setColor("컬러수정 테스트");
//
//		int count = mapper.update(board);
//		log.info("UPDATE COUNT: " + count);
//	}
}
