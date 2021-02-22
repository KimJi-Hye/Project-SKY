package org.zerock.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.ClassNoteVO;
import org.zerock.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ClassNoteMapperTests {

	@Setter(onMethod_ = @Autowired)
	private ClassNoteMapper mapper;
	
	
	
//	@Test
//	public void testGetList() {
//		
//		mapper.getList().forEach(board -> log.info(board));
//	}
	
//	@Test
//	public void testGetChildList() {
//		mapper.getChildList().forEach(board -> log.info(board));
//	}
	
	

//	@Test
//	public void testInsert() {
//		getChildList
//		ClassNoteVO board = new ClassNoteVO();
//		board.setClassName("하늘반");
//		board.setCUnicode("C210210001");
//		board.setTitle("제목");
//		board.setContent("내용");
//		board.setWriter("작성자");
//		
//		mapper.insert(board);
//		
//		log.info(board);
//	}
	
	
	
	
//	@Test
//	public void testInsertSelectKey() {
//		
//		ClassNoteVO board = new ClassNoteVO();
//		board.setClassName("하늘반");
//		board.setCUnicode("C210210002");
//		board.setTitle("제목2");
//		board.setContent("내용2");
//		board.setWriter("작성자2");
//		
//		mapper.insertSelectKey(board);;
//		
//		log.info(board);
//	}
	
	
	
//	@Test
//	public void testRead() {
//		
//		// 존재하는 게시물 번호로 테스트
//		ClassNoteVO board = mapper.read(6L);
//		
//		log.info(board);
//	}

	
	
//	@Test
//	public void testDelete() {
//		
//		log.info("DELETE COUNT: " + mapper.delete(6L));
//	}
	
	
//	@Test
//	public void testUpdate() {
//		
//		ClassNoteVO board = new ClassNoteVO();
//		// 실행 전 존재하는 번호인지 확인할 것
//		board.setBno(4150L);
//		board.setClassname("하늘반");
//		board.setCunicode("C210210002");
//		board.setTitle("제목1");
//		board.setContent("내용1");
//		board.setWriter("작성자1");
//
//		
//		int count = mapper.update(board);
//		log.info("UPDATE COUNT: " + count);
//	}
	
//	@Test
//	public void testPaging() {
//		
//		Criteria cri = new Criteria();
//		
//		cri.setPageNum(1);
//		cri.setAmount(10);
//		
//		List<ClassNoteVO> list = mapper.getListWithPaging(cri);
//		
//		list.forEach(board -> log.info(board));
//	}
	
	
//	@Test
//	public void testSearch() {
//		
//		Criteria cri = new Criteria();
//		cri.setKeyword("하늘반");
//		cri.setType("N");
//		
//		List<ClassNoteVO> list = mapper.getListWithPaging(cri);
//		
//		list.forEach(board -> log.info(board));
//	}
}
