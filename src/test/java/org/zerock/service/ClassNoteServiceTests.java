package org.zerock.service;



import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.ClassNoteVO;


import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ClassNoteServiceTests {

	@Setter(onMethod_ = {@Autowired })
	private ClassNoteService service;
	
//	@Test
//	public void testExist() {
//		
//		log.info(service);
//		assertNotNull(service);
//	}
	
	
//	@Test
//	public void testRegister() {
//		ClassNoteVO board = new ClassNoteVO();
//		board.setClassName("우주반");
//		board.setCUnicode("C210210002");
//		board.setTitle("제목");
//		board.setContent("내용");
//		board.setWriter("작성자");
//		
//		service.register(board);
//		
//		log.info("생성된 게시물의 번호: " + board.getBno());
//	}
	
	
//	@Test
//	public void testGetList() {
//		
//		service.getList(new Criteria(2, 10)).forEach(board -> log.info(board));
//	}
	
//	@Test
//	public void testGetChildList() {
//		service.getChildList().forEach(board -> log.info(board));
//	}
	
	
//	@Test
//	public void testGet() {
//		
//		log.info(service.get(7L));
//	}
	
	
	
//	@Test
//	public void testDelete() {
//		
//		//게시물 번호(bno)의 존재 여부를 확인하고 테스트할 것
//		log.info("REMOVE RESULT: " + service.remove(7L));
//		
//	}
	
	
//	@Test
//	public void testUpdate() {
//		
//		ClassNoteVO board = service.get(4150L);
//		
//		if (board == null) {
//			return;
//		}
//		
//		board.setTitle("테스트1111");
//		log.info("MODIFY RESULT: " + service.modify(board));
//	}
	

	
}
