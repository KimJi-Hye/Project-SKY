package org.zerock.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.ApplyBoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
//Java Config
//@Contextconfiguration(classes = {org.zerock.config.RootConfig.class})
@Log4j
public class ApplyBoardServiceTests {

	@Setter(onMethod_ = {@Autowired })
	private ApplyBoardService service;
	
//	@Test
//	public void testExist() {
//		
//		log.info(service);
//		assertNotNull(service);
//	}
	
	
//	@Test
//	public void testRegister() {
//		ApplyVO board = new ApplyVO();
//		board.setClassName("테스트2");
//		board.setClassAge(7L);
//		board.setClassTotal(20L);
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
//	
//	
//	@Test
//	public void testGet() {
//		
//		log.info(service.get(994804L));
//	}
//	
//	
//	
//	@Test
//	public void testDelete() {
//		
//		//게시물 번호(ano)의 존재 여부를 확인하고 테스트할 것
//		log.info("REMOVE RESULT: " + service.remove(21L));
//		
//	}
//	
//	
//	@Test
//	public void testUpdate() {
//		
//		ApplyBoardVO board = service.get(994804L);
//		
//		if (board == null) {
//			return;
//		}
//		
//		board.setPname("테스트");
//		log.info("MODIFY RESULT: " + service.modify(board));
//	}
	
}
