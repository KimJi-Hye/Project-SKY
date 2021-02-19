package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.AuthorVO;
import org.zerock.mapper.AuthorMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AuthorServiceImpl implements AuthorService {
	
	private AuthorMapper mapper;

	// 등록
	@Override
	public void register(AuthorVO author) {
		log.info("register......." + author);
		mapper.insert(author);
	}

	// 조회
	@Override
	public AuthorVO get(char atgrade) {
		log.info("get......." + atgrade);
		return mapper.read(atgrade);
	}

	// 수정
	@Override
	public boolean modify(AuthorVO author) {
		log.info("modify......." + author);
		return mapper.update(author) == 1;
	}

	// 삭제
	@Override
	public boolean remove(char atgrade) {
		log.info("remove......." + atgrade);
		return mapper.delete(atgrade) == 1;
	}

	// 리스트
	@Override
	public List<AuthorVO> getList() {
		log.info("getList.......");
		return mapper.getList();
	}

}
