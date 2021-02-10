package org.zerock.service;

import java.util.List;

import org.zerock.domain.ClassBoardVO;

public interface ClassBoardService {

	public void register(ClassBoardVO board);
	
	public ClassBoardVO get(Long bno);
	
	public boolean modify(ClassBoardVO board);
	
	public boolean remove(Long bno);
	
	public List<ClassBoardVO> getList();
}
