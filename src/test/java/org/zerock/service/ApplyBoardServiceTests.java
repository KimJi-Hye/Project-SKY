package org.zerock.service;

import static org.junit.Assert.assertNotNull;

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
public class ApplyBoardServiceTests {

	@Setter(onMethod_ = {@Autowired })
	private ApplyBoardService service;
	
	@Test
	public void testExist() {
		
		log.info(service);
		assertNotNull(service);
	}
	
	
	@Test
	public void testGetList() {
		
		service.getList(new Criteria(2, 10)).forEach(board -> log.info(board));
	}
	
//	@Test
//	public void testRegister() {
//		ApplyBoardVO board = new ApplyBoardVO();
//
//		board.setAno("684514");
//		board.setCname("test");
//		board.setRelation("m");
//		board.setPbirth("930915");
//		board.setAddr("청주시 흥덕구 봉명1동");
//		board.setPhone("010-9954-9840");
//		board.setUseremail("cjdwod@naver.com");
//		
//		board.setCname("test..");
//		board.setCgender("girl");
//		board.setCbirth("200202");
//		board.setApptype("접수유형");
//		board.setAppstate("접수");
//		board.setPw("비번12");
//		
//		service.register(board);
//		
//		log.info("생성된 게시물의 번호: " + board.getAno());
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
//		board.setPName("테스트");
//		log.info("MODIFY RESULT: " + service.modify(board));
//	}
	
}
