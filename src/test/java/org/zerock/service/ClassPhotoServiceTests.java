package org.zerock.service;

import static org.junit.Assert.assertNotNull;

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
//@Contextconfiguration(classes = {org.zerock.config.RootConfig.class})
@Log4j
public class ClassPhotoServiceTests {

	@Setter(onMethod_ = {@Autowired })
	private ClassPhotoService service;
	
//	@Test
//	public void testExist() {
//		
//		log.info(service);
//		assertNotNull(service);
//	}
	
	
//	@Test
//	public void testRegister() {
//		ClassPhotoVO board = new ClassPhotoVO();
//		board.setClassName("테스트반");
//		board.setTitle("테스트제목");
//		board.setContent("테스트내용");
//		board.setTag("테스트태그");
//		
//		service.register(board);
//		
//		log.info("생성된 게시물의 번호: " + board.getBno());
//	}
	
	
//	@Test
//	public void testGetList() {
//		
//		service.getList().forEach(board -> log.info(board));
//	}
	
	
//	@Test
//	public void testGet() {
//		
//		log.info(service.get(1L));
//	}
	
	
	
//	@Test
//	public void testDelete() {
//		
//		//게시물 번호의 존재 여부를 확인하고 테스트할 것
//		log.info("REMOVE RESULT: " + service.remove(2L));
//		
//	}
	
	
//	@Test
//	public void testUpdate() {
//		
//		ClassPhotoVO board = service.get(3L);
//		
//		if (board == null) {
//			return;
//		}
//		
//		board.setTitle("제목 수정합니다.");
//		log.info("MODIFY RESULT: " + service.modify(board));
//	}
	
	@Test
	public void testGetList() {
		
		service.getList(new Criteria(2, 10)).forEach(board -> log.info(board));
	}	
	
}
