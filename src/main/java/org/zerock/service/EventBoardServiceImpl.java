package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.EventBoardVO;
import org.zerock.mapper.EventBoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class EventBoardServiceImpl implements EventBoardService{

	//spring 4.3 이상에서 자동 처리
	private EventBoardMapper mapper;
	
	@Override
	public int register(EventBoardVO board) {
	
		log.info("register......" + board);
		
		return mapper.insert(board);
	}
	
	@Override
	public List<EventBoardVO> getList() {

		log.info("getList.........");
		
		return mapper.getList();
	}

	
	@Override
	public EventBoardVO get(Long ano) {

		log.info("get......" + ano);
		
		return mapper.read(ano);
	}

	@Override
	public int modify(EventBoardVO board) {

		log.info("modify......" + board);
		
		return mapper.update(board);
	}

	@Override
	public int remove(Long bno) {

		log.info("remove...." + bno);
		
		return mapper.delete(bno);
	}

}
