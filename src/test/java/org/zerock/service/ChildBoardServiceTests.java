package org.zerock.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
//Java Config
//@Contextconfiguration(classes = {org.zerock.config.RootConfig.class})
@Log4j
public class ChildBoardServiceTests {

	@Setter(onMethod_ = {@Autowired })
	private ChildBoardService service;
	
	
	@Test
	public void testGetList() {
		
		service.getList(new Criteria(2, 10)).forEach(board -> log.info(board));
	}
	
//	@Test
//	public void testExist() {
//		
//		log.info(service);
//		assertNotNull(service);
//	}
	
	
//	@Test
//	public void testRegister() {
//		ChildBoardVO board = new ChildBoardVO();
//
//		board.setCunicode("C210210004");
//		board.setClassname("하늘반");
//		board.setCname("최준용");
//		board.setCbirth("2021/8/12");
//		
//		service.register(board);
//		
//		log.info("생성된 게시물의 번호: " + board.getCunicode());
//	}
//	

//	



//
//	@Test
//	public void testGetList() {
//		
//		service.getList().forEach(board -> log.info(board));
//	}
//	
//	



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
//		log.info(service.get("최하늘"));
//	}
//	
//	
//	
//	@Test
//	public void testDelete() {
//		
//		//게시물 번호(ano)의 존재 여부를 확인하고 테스트할 것
//		log.info("REMOVE RESULT: " + service.remove("최충성"));
//		
//	}
//	
//	
//	@Test
//	public void testUpdate() {
//		
//		ChildBoardVO board = service.get("C210210003");
//		
//		if (board == null) {
//			return;
//		}
//		
//		board.setCname("최충성");
//		log.info("MODIFY RESULT: " + service.modify(board));
//	}
	
}
