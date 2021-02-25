package org.zerock.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.ClassPhotoVO;
import org.zerock.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
//Java Config
//@ContextConfiguration(classes = {org.zerock.config.RootConfig.class})
@Log4j
public class ClassPhotoMapperTests {

	@Setter(onMethod_ = @Autowired)
	private ClassPhotoMapper mapper;
	
	
	
//	@Test
//	public void testGetList() {
//		
//		mapper.getList().forEach(board -> log.info(board));
//	}
	

	
//	@Test
//	public void testInsert() {
//		
//		ClassPhotoVO board = new ClassPhotoVO();
//		board.setClassName("테스트반");
//		board.setTitle("테스트제목");
//		board.setContent("테스트내용");
//		board.setTag("테스트태그");
//		
//		mapper.insert(board);;
//		
//		log.info(board);
//	}
	
	
	
//	@Test
//	public void testInsertSelectKey() {
//		
//		ClassPhotoVO board = new ClassPhotoVO();
//		board.setClassName("테스트반");
//		board.setTitle("테스트제목");
//		board.setContent("테스트내용");
//		board.setTag("테스트태그");
//		
//		mapper.insertSelectKey(board);;
//		
//		log.info(board);
//	}
	
	
	
//	@Test
//	public void testRead() {
//		
//		// 존재하는 게시물 번호로 테스트
//		ClassPhotoVO board = mapper.read(1L);
//		
//		log.info(board);
//	}

	
	
//	@Test
//	public void testDelete() {
//		
//		log.info("DELETE COUNT: " + mapper.delete(2L));
//	}
	
	
//	@Test
//	public void testUpdate() {
//		
//		ClassPhotoVO board = new ClassPhotoVO();
//		// 실행 전 존재하는 번호인지 확인할 것
//		board.setBno(1L);
//		board.setClassName("테스트반2");
//		board.setTitle("테스트제목22");
//		board.setContent("테스트내용222");
//		board.setTag("테스트태그2222");
//		
//		int count = mapper.update(board);
//		log.info("UPDATE COUNT: " + count);
//	}
	
	@Test
	public void testPaging() {
		
		Criteria cri = new Criteria();
		
		cri.setPageNum(3);
		cri.setAmount(10);
		
		List<ClassPhotoVO> list = mapper.getListWithPaging(cri);
		
		list.forEach(board -> log.info(board));
	}	
	
	
}
