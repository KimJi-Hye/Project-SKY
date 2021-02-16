package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.ChildBoardVO;
import org.zerock.mapper.ChildBoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ChildBoardServiceImpl implements ChildBoardService{

	//spring 4.3 이상에서 자동 처리
	private ChildBoardMapper mapper;
	
	@Override
	public void register(ChildBoardVO board) {
	
		log.info("register......" + board);
		
		mapper.insert(board);
	}
	
	@Override
	public List<ChildBoardVO> getList() {

		log.info("getList.........");
		
		return mapper.getList();
	}

	@Override
	public ChildBoardVO get(String cunicode) {

		log.info("get......" + cunicode);
		
		return mapper.read(cunicode);
	}

	@Override
	public boolean modify(ChildBoardVO board) {

		log.info("modify......" + board);
		
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(String cunicode) {

		log.info("remove...." + cunicode);
		
		return mapper.delete(cunicode) == 1;
	}

	@Override
	public boolean update(ChildBoardVO board) {
		// TODO Auto-generated method stub
		return false;
	}

}
