package org.zerock.mapper;


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
//@ContextConfiguration(classes = {org.zerock.config.RootConfig.class})
@Log4j
public class ApplyBoardMapperTests {

	@Setter(onMethod_ = @Autowired)
	private ApplyBoardMapper mapper;
	
	
	
	@Test
	public void testGetList() {
		
		mapper.getList().forEach(board -> log.info(board));
	}
	
	
	
//	@Test
//	public void testInsert() {
//		
//		ApplyBoardVO board = new ApplyBoardVO();
//		
//		board.setAno("994804");
//		board.setPName("test");
//		board.setRelation("m");
//		board.setPBirth("930915");
//		board.setAddr("청주시 흥덕구 봉명1동");
//		board.setPhone("010-9954-9840");
//		
//		board.setCName("test..");
//		board.setCGender("girl");
//		board.setCBirth("200202");
//		board.setAppType("접수유형");
//		board.setAppState("접수");
//		board.setPw("비번12");
//		
//		mapper.insert(board);
//		
//		log.info(board);
//	}
//	
//	
//	
//	
//	@Test
//	public void testInsertSelectKey() {
//		
//		ApplyBoardVO board = new ApplyBoardVO();
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
//		ApplyBoardVO board = mapper.read(1L);
//		
//		log.info(board);
//	}
//
//	
//	
//	@Test
//	public void testDelete() {
//		
//		ApplyBoardVO board = new ApplyBoardVO();
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
//		ApplyBoardVO board = new ApplyBoardVO();
//
//		board.setAno("351804");
//		board.setPName("김지혜");
//		board.setRelation("w");
//		board.setPBirth("950517");
//		board.setAddr("청주시 흥덕구 봉명4동");
//		board.setPhone("010-4857-5080");
//		
//		board.setCName("김..");
//		board.setCGender("girl");
//		board.setCBirth("200552");
//		board.setAppType("접수유형");
//		board.setAppState("접수");
//		board.setPw("븨번123");
//
//		int count = mapper.update(board);
//		log.info("UPDATE COUNT: " + count);
//	}
//	
//	@Test
//	public void testcUpdate() {
//		
//		ApplyBoardVO board = new ApplyBoardVO();
//		
//		board.setAno("630192");
//		board.setCUnicode("2102100517");
//		board.setCClass("개나리반");
//		board.setEnter("210210");
//		board.setGraduation("220302");
//		board.setPw("아니뭐123");
//		
//		int count = mapper.cupdate(board);
//		log.info("UPDATE COUNT: " + count);
//	}
}
