package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.AuthorVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AuthorMapperTests {

	@Setter(onMethod_ = @Autowired)
	private AuthorMapper mapper;
	
	// 전체 조회
//	@Test
//	public void testGetList() {
//		mapper.getList().forEach(list -> log.info(list));
//	}
	
	// insert
//	@Test
//	public void testInsert() {
//		AuthorVO author = new AuthorVO();
//		author.setAtgrade("S");
//		author.setAtname("테스트 이름");
//		author.setClassname("반이름");
//		mapper.insert(author);
//		log.info(author);
//	}
	
	// read
//	@Test
//	public void testREad() {
//		AuthorVO read = mapper.read("S");
//		log.info(read);
//	}
	
	// update
//	@Test
//	public void testUpdate() {
//		AuthorVO author = new AuthorVO();
//		author.setAtgrade("S");
//		author.setAtname("테스트 수정");
//		author.setClassname("반이름 수정");
//		
//		int count = mapper.update(author);
//		log.info("UPDATE COUNT : " + count);
//	}
	
	// delete
//	@Test
//	public void testDelete() {
//		log.info("DELETE COUNT : " + mapper.delete("S"));
//	}
	
}
