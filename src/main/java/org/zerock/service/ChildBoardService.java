package org.zerock.service;

import java.util.List;

import org.zerock.domain.ChildBoardVO;


public interface ChildBoardService {

	public void register(ChildBoardVO board);
	
	public ChildBoardVO get(String cunicode);
	
	public boolean modify(ChildBoardVO board);
	
	public boolean update(ChildBoardVO board);
	
	public boolean remove(String cunicode);
	
	public List<ChildBoardVO> getList();
}
