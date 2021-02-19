package org.zerock.service;

import static org.junit.Assert.assertNotNull;

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
public class AuthorServiceTests {

	@Setter(onMethod_ = {@Autowired})
	private AuthorService service;
	
	// 객체 생성 테스트
//	@Test
//	public void testExist() {
//		log.info(service);
//		assertNotNull(service);
//	}
	
	// 등록
//	@Test
//	public void testRegister() {
//		AuthorVO author = new AuthorVO();
//		author.setAtgrade("s");
//		author.setAtname("테스트 이름");
//		author.setClassname("반이름");
//		service.register(author);
//		log.info(author.getAtgrade() + ">> 등록되었습니다.");
//	}
	
	// 리스트
//	@Test
//	public void testGetList() {
//		service.getList().forEach(list -> log.info(list));
//	}
	
	// 수정
//	@Test
//	public void testUpdate() {
//		AuthorVO author = service.get("s");
//		if(author == null) {
//			return;
//		}
//		author.setAtname("테스트 수정");
//		author.setClassname("반이름 수정");
//		log.info("MODIFY RESULT : " + service.modify(author));
//	}
	
	// 삭제
//	@Test
//	public void testDelete() {
//		log.info("REMOVE RESULT : " + service.remove('s'));
//	}
	
}
