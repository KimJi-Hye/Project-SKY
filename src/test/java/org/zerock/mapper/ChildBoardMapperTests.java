package org.zerock.mapper;


import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.ChildBoardVO;
import org.zerock.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
//Java Config
//@ContextConfiguration(classes = {org.zerock.config.RootConfig.class})
@Log4j
public class ChildBoardMapperTests {

	@Setter(onMethod_ = @Autowired)
	private ChildBoardMapper mapper;
	
	
	
//	@Test
//	public void testGetList() {
//		
//		mapper.getList().forEach(board -> log.info(board));
//	}
	
	@Test
	public void testGetList() {
		
		Criteria cri = new Criteria();
		
		List<ChildBoardVO> list = mapper.getListWithPaging(cri);
		
		list.forEach(board -> log.info(board));
	}
	
	
	
//	@Test
//	public void testInsert() {
//		
//		ChildBoardVO board = new ChildBoardVO();
//		
//		board.setCunicode("C210210003");
//		board.setClassname("하늘반");
//		board.setCgender("남자");
//		board.setCname("박준용");
//		board.setCbirth("20/10/23");
//		board.setEnter("2021/7/15");
//		board.setGraduation("2021/3/24");
//		
//		
//		mapper.insert(board);
//		
//		log.info(board);
//	}
	
//	
//	
//	
//	@Test
//	public void testInsertSelectKey() {
//		
//		ChildBoardVO board = new ChildBoardVO();
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
//		ChildBoardVO board = mapper.read(1L);
//		
//		log.info(board);
//	}
//
//	
//	
//	@Test
//	public void testDelete() {
//		
//		ChildBoardVO board = new ChildBoardVO();
//		
//		board.setCunicode("C210210002");
//		
//		mapper.delete(board);
//		log.info("DELETE COUNT: " + board);
//	}
//	
//	
//	@Test
//	public void testcUpdate() {
//		
//		ChildBoardVO board = new ChildBoardVO();
//		
//		board.setCunicode("C210210003");
//		board.setClassname("우주반");
//		board.setCname("우라차");
//		board.setCbirth("2021/10/21");
//		
//		int count = mapper.update(board);
//		log.info("UPDATE COUNT: " + count);
//	}
}
