package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.ClassNoteVO;
import org.zerock.mapper.ClassNoteMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ClassNoteServiceImpl implements ClassNoteService{

	//spring 4.3 이상에서 자동 처리
	private ClassNoteMapper mapper;
	
	@Override
	public void register(ClassNoteVO board) {
	
		log.info("register......" + board);
		
		mapper.insertSelectKey(board);
	}
	
	@Override
	public List<ClassNoteVO > getList() {

		log.info("getList.........");
		
		return mapper.getList();
	}

	@Override
	public ClassNoteVO  get(Long bno) {

		log.info("get......" + bno);
		
		return mapper.read(bno);
	}

	@Override
	public boolean modify(ClassNoteVO  board) {

		log.info("modify......" + board);
		
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long bno) {

		log.info("remove...." + bno);
		
		return mapper.delete(bno) == 1;
	}
}