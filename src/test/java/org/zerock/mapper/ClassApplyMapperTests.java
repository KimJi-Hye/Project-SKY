package org.zerock.mapper;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.ClassApplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
//Java Config
//@ContextConfiguration(classes = {org.zerock.config.RootConfig.class})
@Log4j
public class ClassApplyMapperTests {

	@Setter(onMethod_ = @Autowired)
	private ClassApplyMapper mapper;
	
	
	
//	@Test
//	public void testGetList() {
//		
//		mapper.getList().forEach(board -> log.info(board));
//	}
	
	
	
	@Test
	public void testInsert() {
		
		ClassApplyVO board = new ClassApplyVO();
		
		board.setAno("351804");
		board.setPname("김충성");
		board.setRelation("m");
		board.setPbirth("930518");
		board.setAddr("청주시 흥덕구 봉명3동");
		board.setPhone("010-9146-5180");
		
		board.setCname("김..");
		board.setCgender("man");
		board.setCbirth("190522");
		board.setApptype("접수유형");
		board.setAppstate("접수");
		board.setPw("븨번123");
		
		mapper.insert(board);
		
		log.info(board);
	}
	
	
	
	
//	@Test
//	public void testInsertSelectKey() {
//		
//		ClassApplyVO board = new ClassApplyVO();
//		board.setPname("우주반");
//		board.setRelation("");
//		board.setPbirth("");
//		
//		mapper.insertSelectKey(board);;
//		
//		log.info(board);
//	}
	
	
	
//	@Test
//	public void testRead() {
//		
//		// 존재하는 게시물 번호로 테스트
//		ClassBoardVO board = mapper.read(1L);
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
//		ClassBoardVO board = new ClassBoardVO();
//		// 실행 전 존재하는 번호인지 확인할 것
//		board.setBno(1L);
//		board.setClassName("하늘반");
//		board.setClassAge(5L);
//		board.setClassTotal(10L);
//		
//		int count = mapper.update(board);
//		log.info("UPDATE COUNT: " + count);
//	}
	

}
