package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.ChildBoardVO;
import org.zerock.domain.ClassMngVO;
import org.zerock.domain.JoinTeacherVO;
import org.zerock.mapper.ClassMngMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ClassMngServiceImpl implements ClassMngService{

	//spring 4.3 이상에서 자동 처리
	private ClassMngMapper mapper;
	
	@Override
	public void register(ClassMngVO board) {
	
		log.info("register......" + board);
		
		mapper.insertSelectKey(board);
	}
	
	@Override
	public List<ClassMngVO> getList() {

		log.info("getList.........");
		
		return mapper.getList();
	}

	@Override
	public ClassMngVO get(Long bno) {

		log.info("get......" + bno);
		
		return mapper.read(bno);
	}
	
	@Override
	public List<ChildBoardVO> getChildList() {
		log.info("Get Child List");
		return mapper.getChildList();
	}

	@Override
	public JoinTeacherVO getTeacher(Long bno) {
		log.info("getteacher......" + bno);
		
		return mapper.readTeacher(bno);
	}

	@Override
	public boolean modify(ClassMngVO board) {

		log.info("modify......" + board);
		
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long bno) {

		log.info("remove...." + bno);
		
		return mapper.delete(bno) == 1;
	}



}
