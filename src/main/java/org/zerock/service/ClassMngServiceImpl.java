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
	public ClassMngVO get(String className) {

		log.info("get......" + className);
		
		return mapper.read(className);
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

	@Override
	public boolean update(ClassMngVO board) {
		
		log.info("update......" + board);
		
		return mapper.update(board) == 1;
	}

	@Override
	public ChildBoardVO getChild(String className) {
		log.info("getchild......" + className);
		
		return mapper.readChild(className);
	}

	@Override
	public JoinTeacherVO getTeacher(String className) {
		log.info("getteacher......" + className);
		
		return mapper.readTeacher(className);
	}
}
