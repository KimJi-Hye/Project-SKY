package org.zerock.mapper;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.QuestionsBoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
//Java Config
//@ContextConfiguration(classes = {org.zerock.config.RootConfig.class})
@Log4j
public class QuestionsBoardMapperTests {

	@Setter(onMethod_ = @Autowired)
	private QuestionsBoardMapper mapper;
	
	
	
//	@Test
//	public void testGetList() {
//		
//		mapper.getList().forEach(board -> log.info(board));
//	}
	
	
	
	@Test
	public void testInsert() {
		
		QuestionsBoardVO board = new QuestionsBoardVO();
		
		board.setTitle("test002");
		board.setContent("test002");
		board.setWriter("test002");
		board.setPw("1234");
		
		mapper.insert(board);
		
		log.info(board);
	}
//	
//	
//	
//	
//	@Test
//	public void testInsertSelectKey() {
//		
//		ApplyBoardVO board = new ApplyBoardVO();
//		board.setPName("우주반");
//		board.setRelation("");
//		board.setPBirth("");
//		
//		mapper.insertSelectKey(board);;
//		
//		log.info(board);
//	}
//	
//	
//	
//	@Test
//	public void testRead() {
//		
//		// 존재하는 게시물 번호로 테스트
//		QuestionsBoardVO board = mapper.read(2L);
//		
//		log.info(board);
//	}
//
//	
//	
//	@Test
//	public void testDelete() {
//		
//		QuestionsBoardVO board = new QuestionsBoardVO();
//		
//		board.setBno(2L);
//		
//		mapper.delete(board);
//		log.info("DELETE COUNT: " + board);
//	}
//	
//	@Test
//	public void testUpdate() {
//		
//		QuestionsBoardVO board = new QuestionsBoardVO();
//
//		board.setBno(3L);
//		board.setTitle("김충성");
//		board.setContent("정혜윤");
//		board.setWriter("박준용");
//		board.setPw("4321");
//
//		int count = mapper.update(board);
//		log.info("UPDATE COUNT: " + count);
//	}
//	
}
