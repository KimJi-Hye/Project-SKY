package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.ClassBoardVO;
import org.zerock.mapper.ClassBoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ClassBoardServiceImpl implements ClassBoardService{

	//spring 4.3 이상에서 자동 처리
	private ClassBoardMapper mapper;
	
	@Override
	public void register(ClassBoardVO board) {
	
		log.info("register......" + board);
		
		mapper.insertSelectKey(board);
	}
	
	@Override
	public List<ClassBoardVO> getList() {

		log.info("getList.........");
		
		return mapper.getList();
	}

	@Override
	public ClassBoardVO get(Long bno) {

		log.info("get......" + bno);
		
		return mapper.read(bno);
	}

	@Override
	public boolean modify(ClassBoardVO board) {

		log.info("modify......" + board);
		
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long bno) {

		log.info("remove...." + bno);
		
		return mapper.delete(bno) == 1;
	}
}
