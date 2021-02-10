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
		
		board.setAno("994804");
		board.setPname("test");
		board.setRelation("m");
		board.setPbirth("930915");
		board.setAddr("청주시 흥덕구 봉명1동");
		board.setPhone("010-9954-9840");
		
		board.setCname("test..");
		board.setCgender("girl");
		board.setCbirth("200202");
		board.setApptype("접수유형");
		board.setAppstate("접수");
		board.setPw("비번12");
		
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
//		ClassApplyVO board = new ClassApplyVO();
//		
//		board.setAno("994804");
//		board.setPw("비번12");
//		
//		mapper.delete(board);
//		log.info("DELETE COUNT: " + board);
//	}
//	
	
//	@Test
//	public void testUpdate() {
//		
//		ClassApplyVO board = new ClassApplyVO();
//
//		board.setAno("351804");
//		board.setPname("김지혜");
//		board.setRelation("w");
//		board.setPbirth("950517");
//		board.setAddr("청주시 흥덕구 봉명4동");
//		board.setPhone("010-4857-5080");
//		
//		board.setCname("김..");
//		board.setCgender("girl");
//		board.setCbirth("200552");
//		board.setApptype("접수유형");
//		board.setAppstate("접수");
//		board.setPw("븨번123");
//
//		int count = mapper.update(board);
//		log.info("UPDATE COUNT: " + count);
//	}
	
//	@Test
//	public void testcUpdate() {
//		
//		ClassApplyVO board = new ClassApplyVO();
//		
//		board.setAno("630192");
//		board.setCunicode("2102100517");
//		board.setCclass("개나리반");
//		board.setEnter("210210");
//		board.setGraduation("220302");
//		board.setPw("아니뭐123");
//		
//		int count = mapper.cupdate(board);
//		log.info("UPDATE COUNT: " + count);
//	}
}
