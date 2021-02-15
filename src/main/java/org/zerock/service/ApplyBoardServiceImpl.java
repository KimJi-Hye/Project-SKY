package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.ApplyBoardVO;
import org.zerock.mapper.ApplyBoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ApplyBoardServiceImpl implements ApplyBoardService{

	//spring 4.3 이상에서 자동 처리
	private ApplyBoardMapper mapper;
	
	@Override
	public void register(ApplyBoardVO board) {
	
		log.info("register......" + board);
		
		mapper.insert(board);
	}
	
	@Override
	public List<ApplyBoardVO> getList() {

		log.info("getList.........");
		
		return mapper.getList();
	}

	@Override
	public ApplyBoardVO get(Long ano) {

		log.info("get......" + ano);
		
		return mapper.read(ano);
	}

	@Override
	public boolean modify(ApplyBoardVO board) {

		log.info("modify......" + board);
		
		return mapper.update(board) == 1;
	}
	
	@Override
	public boolean update(ApplyBoardVO board) {

		log.info("update......" + board);
		
		return mapper.cupdate(board) == 1;
	}	

	@Override
	public boolean remove(Long ano) {

		log.info("remove...." + ano);
		
		return mapper.delete(ano) == 1;
	}

}
