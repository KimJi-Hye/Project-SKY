package org.zerock.mapper;


import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.QnaReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
//Java Config
//@ContextConfiguration(classes = {org.zerock.config.RootConfig.class})
@Log4j
public class QnaReplyMapperTests {

	
	private Long[] bnoArr = {4L, 6L, 7L, 8L};
	
	@Setter(onMethod_ = @Autowired)
	private QnaReplyMapper mapper;
	
//	@Test
//	public void testCreate() {
//		
//		IntStream.rangeClosed(1, 10).forEach(i -> {
//
//			QnaReplyVO vo = new QnaReplyVO();
//			
//			vo.setBno(bnoArr[i % 5]);
//			vo.setContent("댓글 테스트 + i");
//			vo.setWriter("replyer" + i);
//			
//			mapper.insert(vo);
//			
//			log.info(vo);
//			
//		});
//	}
	
	@Test
	public void TestList2() {
		
		Criteria cri = new Criteria(2, 10);
		
		List<QnaReplyVO> replies = mapper.getListWithPaging(cri, 1L);
		
		replies.forEach(reply -> log.info(reply));
		
	}
	

	
//	@Test
//	public void testRead() {
//		
//		Long targetRno = 4L;
//		
//		QnaReplyVO vo = mapper.read(targetRno);
//		
//		log.info(vo);
//	}
	
//	@Test
//	public void testGetList() {
//		
//		mapper.getList().forEach(board -> log.info(board));
//	}

	
//	@Test
//	public void testInsert() {
//		
//		QnaReplyVO vo = new QnaReplyVO();
//		
//		board.setTitle("test002");
//		board.setContent("test002");
//		board.setWriter("test002");
//		board.setPw("1234");
//		
//		mapper.insert(board);
//		
//		log.info(board);
//	}
	
	
//	@Test
//	public void testInsertSelectKey() {
//		
//		QnaReplyVO board = new QnaReplyVO();
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
//		QnaReplyVO board = mapper.read(2L);
//		
//		log.info(board);
//	}
//
//	
//	
//	@Test
//	public void testDelete() {
//		
//		QnaReplyVO vo = new QnaReplyVO();
//		
//		vo.setBno(3L);
//		
//		mapper.delete(vo);
//		log.info("DELETE COUNT: " + vo);
//	}
//	
//	@Test
//	public void testUpdate() {
//		
//		QnaReplyVO reply = new QnaReplyVO();
//
//		reply.setBno(4L);
//		reply.setContent("할로");
//		reply.setWriter("반갑습니다");
//
//		int count = mapper.update(reply);
//		log.info("UPDATE COUNT: " + count);
//	}
	
	@Test
	public void testList() {
		
		Criteria cri = new Criteria();
		
		List<QnaReplyVO> replies = mapper.getListWithPaging(cri, bnoArr[0]);
		
		replies.forEach(reply -> log.info(reply));
	}
	
	
}
